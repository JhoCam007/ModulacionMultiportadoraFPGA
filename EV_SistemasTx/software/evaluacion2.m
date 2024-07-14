clear; clc;
%%%%%%%%%%%%%%%%%%%%%%% DATOS MODULACION - PORTADORA %%%%%%%%%%%%%%%%%%%%%%
alpha = 3;
Fs1 = 125e6;                        % Frecuencia Pitaya 
K1 = 6;                         % Numero de Subportadora
n = 4 + alpha;              % Numero de bits de interpolador2
max_conta = 2^n - 1;
Tsimbolo_real = (((2^n)*K1)/Fs1);  % Tiempo de simbolo real
Delta_f = 1/Tsimbolo_real;      % Saltos de Frecuencia
Fs = Delta_f*K1;                 % Frecuencia de muestreo de OFDM (Banda Base)
Fs1/(2^n);
n1 = 2;                    % Numero de bits de portadora 
Fp = Fs1/2^n1;                  % Portadora
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bits_TX1 = ["010000111011","000011011000","100001001100"];
           
x_n = [(0.9+0.9*j)*ones(1,7)];
for k123 = bits_TX1 
    bits_TX = char(k123);
% bits_TX = '101001111011111010100001101000110001';
    val_1 = 11; 
    val_2 = 12;
    acu = 0;    
    simbolos = [];
    for k = 1:K1
        mapeo = mapeo_bits(bits_TX(val_1:val_2));
        val_1 =  val_1 -2;
        val_2 =  val_2 - 2; 
        simbolos=[simbolos;mapeo];
    end
    A = zeros([K1,K1]);
    for n1 = 1:K1
        for k = 1:K1
            A(n1,k) = exp(j*2*pi*(k-1)*(n1-1)/K1)/(K1*sqrt(2));
        end 
    end 
    % Vector de simbolos
    x = half(A)*half(simbolos);         % Modulacion OFDM
    x_n1 = transpose(half(x));
    x_n1 = [x_n1(5:end),x_n1];
    x_n = [x_n,x_n1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%% INTERPOLACION SIMPLE %%%%%%%%%%%%%%%%%%%%%%%%%%% 
K = length(x_n)/2;
L   = round(Fs1/Fs);
n_elem = 2*K*L;             %Numero de elementos de la signal interpolada
pos = 0:L:n_elem-L;
x_n_inter = zeros(1,n_elem);
x_n_inter(pos+1) = x_n;
for k1 = 2:L
    x_n_inter(pos+k1) = x_n;
end
x_n_inter = [x_n_inter] ;
x_n_inter = downsample(x_n_inter,12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% LECTURA_DATOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = fopen('pll (1).dat', 'rb');
values = fread(f, Inf, 'float');

complex_v = (values(50e6+1:2:100e6) + values(50e6+2:2:100e6)*i)*2;

% Calcular la correlación cruzada
[c, lags] = xcorr(complex_v,x_n_inter);

% Encontrar el índice de la máxima correlación
[~, indice_mejor_coincidencia] = max(abs(c));

% Obtener el lag correspondiente a la mejor coincidencia
lag_mejor_coincidencia = lags(indice_mejor_coincidencia);
% Mostrar los resultados
disp('La mejor coincidencia ocurre en el lag:');
long_xn = length(x_n_inter);
for k = long_xn:-1:1
    fprintf('%g%+gj, ', real(x_n_inter(k)), imag(x_n_inter(k)));
end 


subplot(2,1,1)
complex_v_m = complex_v(lag_mejor_coincidencia+1:lag_mejor_coincidencia+1+500);
x_n_inter_m = x_n_inter(1:end); 
plot(real(complex_v_m))
hold on;
plot(real(x_n_inter_m))
title("Real")
subplot(2,1,2)
plot(imag(complex_v_m))
hold on;
plot(imag(x_n_inter_m))
title("Imaginario")
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