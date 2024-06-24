clear; clc;
format long
%%%%%%%%%%%%%%%%%%%%%%% DATOS MODULACION - PORTADORA %%%%%%%%%%%%%%%%%%%%%%
Fs1 = 125e6;                        % Frecuencia Pitaya 
K  = 2;                             % Numero de Subportadora
M  = 3;                             % Numero de Subsimbolos 
N = K*M; 

n1 = log2(K);
n  = 7;                             % Numero de bits del contador en la FPGA
Delta_f = Fs1/(2^(n+n1));           % Saltos de frecuencia 
Delta_t = 1/Delta_f;                % Saltos en tiempo 
Fs = K*Delta_f;                     % Frecuencia de muestreo de la modulacion / Ancho de Banda
T_simbolo = M*Delta_t;              % Tiempo de simbolo
alpha = 0.6;
T = 1/Delta_f; 
n2 = 2;                             % Numero de bits de portadora 
Fp = Fs1/2^n2;                      % Portadora
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% FILTRO FORMADOR DE PULSO %%%%%%%%%%%%%%%%%%%%%%%%
sinc_1 = @(t,T) sinc(t./T);
cos_1  = @(t,T,alpha) cos((pi*alpha/T).*t);
f_1    = @(t,T,alpha) 1- ((2*alpha/T).^2).*(t.^2);
filtro = @(t,T,alpha)(sinc_1(t,T).*cos_1(t,T,alpha))./f_1(t,T,alpha);
t = (-3:2).*(1/Fs);
filtro_base = fftshift(filtro(t,T,alpha))

g_km = @(n,k,m,K,M) filtro_base(mod(n-m*K,K*M)+1).*exp(j*((2*pi*k/K).*n));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MODULACION GFDM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generacion de la matriz A
bits_TX1 = ["010000111011","000011011000","101101011000"];
x_n = [(0.9+0.9*j)*ones(1,7)];
for k123 = bits_TX1 
    bits_TX = char(k123);
% bits_TX = '101001111011111010100001101000110001';
    val_1 = 11; 
    val_2 = 12;
    acu = 0;    
    simbolos = [];
    for k = 1:N
        mapeo = mapeo_bits(bits_TX(val_1:val_2));
        val_1 =  val_1 -2;
        val_2 =  val_2 - 2; 
        simbolos=[simbolos;mapeo];
    end
    A = zeros([N,N]);
    for n1 = 0:(N-1)
        for k = 0:(K-1)
            for m = 0:(M-1)
                A(n1+1,m+M*k+1) = g_km(n1,k,m,K,M)/(K*sqrt(2*M));
            end 
        end 
    end 
    A
    % Vector de simbolos
    x = half(A)*half(simbolos)         % Modulacion OFDM
    x_n1 = transpose(half(x));
    x_n1 = [x_n1(5:end),x_n1];
    x_n = [x_n,x_n1];
end

% % Prefijo ciclico
% for acu = x_n 
%     variable = real(acu);
%     disp(['Acu_real    : ',num2str(variable),     '     ', dec2IEEE754(variable),' ',hex_dec2IEEE754(variable)]);
%     variable = imag(acu);
%     disp(['Acu_comp    : ',num2str(variable),     '     ', dec2IEEE754(variable),' ',hex_dec2IEEE754(variable)]);
%     disp(['***********************************************************************']);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%% INTERPOLACION SIMPLE %%%%%%%%%%%%%%%%%%%%%%%%%%% 
% nx = 0:7;
% x_n = 0.8*cos(2*pi*(1/8)*nx);
K = length(x_n)/2;
L   = round(Fs1/Fs)
% L =2^3;
n_elem = 2*K*L;             %Numero de elementos de la signal interpolada
pos = 0:L:n_elem-L;
x_n_inter = zeros(1,n_elem);
x_n_inter(pos+1) = x_n;
for k1 = 2:L
    x_n_inter(pos+k1) = x_n;
end
x_n_inter = [x_n_inter];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SDR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
n_y = 0:(length(x_n_inter)-1);
y1 = cos(pi*n_y/2);
y2 = sin(pi*n_y/2);
result = half(real(x_n_inter)).*half(y1) - half(imag(x_n_inter)).*half(y2);
result = half([result]);
tiempo = 172;
contabc = 1;
f = @(x) dec2hex(round((x + 1).*((2.^14-1)./2)));
% for acu = result
%     variable = real(acu);
%     
%     disp([num2str(tiempo),'ns =>',num2str(variable),' ',hex_dec2IEEE754(variable), ' ', f(single(variable))]);
%     tiempo = tiempo + (10^9)/Fs1;
%     contabc = contabc + 1;
% end 
result_fft = fftshift(fft(result));
subplot(2,1,1)
timepo_s = (0:(length(result_fft)-1))*(1/Fs1);
plot(timepo_s,result)
subplot(2,1,2)
freq = linspace(-Fs1/2,Fs1/2,length(result_fft));
result_fft_abs =abs(result_fft);
frq_min = (Fp-Fs/2)*10^-6;
frq_max = (Fp+Fs/2)*10^-6;
val_max = max(result_fft_abs);
valores = 0:val_max;
plot(freq*(10^-6),result_fft_abs)
hold on;
plot(frq_min*ones(1,length(valores)),valores)
plot(frq_max*ones(1,length(valores)),valores)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RX  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
figure(2)
n_y = 0:(length(result_fft)-1);
result_rx_fft = result_fft(freq>0);
result_rx_fft = 2.*[zeros(1,length(result_fft)-length(result_rx_fft)),result_rx_fft];
result_rx = ifft(fftshift(result_rx_fft)).*exp((-j*2*pi*Fp/Fs1)*(n_y));
result_rx_fft = fftshift(fft(result_rx));
result_rx_fft = result_rx_fft(freq<=(20e6) & freq>=-(20e6));
result_rx_fft = [zeros(1,(length(result_fft)-length(result_rx_fft))/2),result_rx_fft,zeros(1,(length(result_fft)-length(result_rx_fft))/2)];
result_rx = ifft(fftshift(result_rx_fft));
result_rx = downsample(result_rx,1);
result_rx_fft = fftshift(fft(result_rx));
freq = linspace(-Fs1/128,Fs1/128,length(result_rx));


plot(timepo_s,real(x_n_inter))
hold on;
plot(timepo_s,imag(x_n_inter))

% figure(3)
% plot(freq*(10^-6),(abs(fftshift(fft((result_rx))))))
%plot(freq*(10^-6),abs(result_rx_fft))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mapeo = mapeo_bits(bits)
    if bits == '00' 
        mapeo = -1 + 1i;
    elseif bits == '01' 
        mapeo = 1 + 1i;
    elseif bits == '11' 
        mapeo = 1 - 1i;
    elseif bits == '10' 
        mapeo = -1 - 1i;
    end 
end 
function result = dec2IEEE754(val)
    valor = single(val);
    rep_hex = num2hex(valor);
    result = dec2bin(hex2dec(rep_hex), 32);
end
function result = hex_dec2IEEE754(val)
    valor = single(val);
    result = num2hex(valor);
end