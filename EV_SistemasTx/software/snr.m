clear; clc; 
%%%%%%%%%%%%%%%%%%%%%%% DATOS MODULACION - PORTADORA %%%%%%%%%%%%%%%%%%%%%%
Fs1 = 125e6;                       % Frecuencia Pitaya 
K1 = 6;                            % Numero de Subportadora
n = 7;                             % Numero de bits de interpolador2
Tsimbolo_real = (((2^n)*K1)/Fs1);  % Tiempo de simbolo real
Delta_f = 1/Tsimbolo_real;         % Saltos de Frecuencia
Fs = Delta_f*K1;                   % Frecuencia de muestreo de OFDM (Banda Base)
n1 = 2;                            % Numero de bits de portadora 
Fp = Fs1/2^n1;                     % Portadora
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pn_r = [];

for a = 1:2 
    if a == 1
        direc  = ["OFDM_2/10cm/pll.dat","OFDM_2/14cm/pll.dat","OFDM_2/18cm/pll.dat","OFDM_2/22cm/pll.dat","OFDM_2/26cm/pll.dat"];
        x_n = ofdm(6);
    else
        direc  = ["GFDM_1/10cm/pll.dat","GFDM_1/14cm/pll.dat","GFDM_1/18cm/pll.dat","GFDM_1/22cm/pll.dat","GFDM_1/26cm/pll.dat"];
        
        Delta_f = Fs1/(2^(n+1));           % Saltos de frecuencia 
        Delta_t = 1/Delta_f;                % Saltos en tiempo 
        x_n = gfdm(6,2,3,Delta_t,0.6,Fs);
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

    %%%%%%%%%%%%%%%%%%%%%%%%%%%% LECTURA_DATOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    snr1 = [];
    for str = direc
        num_elem = 6952;
        f = fopen(char(str), 'rb');
        values = fread(f, Inf, 'float');
        complex_v = (values(1:2:10e6) + values(2:2:10e6)*i);
        ruido = complex_v(500e3:500e3+num_elem-1);
        complex_v = (values(200e6+1:2:end) + values(200e6+2:2:end)*i);
        % Calcular la correlación cruzada
        [c, lags] = xcorr(complex_v,x_n_inter);
        % Encontrar el índice de la máxima correlación
        [~, indice_mejor_coincidencia] = max(abs(c));
        % Obtener el lag correspondiente a la mejor coincidencia
        lag_mjr_cd = lags(indice_mejor_coincidencia);
        pos_signal =lag_mjr_cd+1+330 +1; 
        
        
        complex_v_m = complex_v(pos_signal:pos_signal+num_elem-1); 
        prx = sum(abs(complex_v_m).^2)/num_elem; 
        pn0 = sum(abs(ruido).^2)/num_elem;
        round(10*log10((prx-pn0)/pn0),2);
        pn_r = [pn_r,pn0];
        
         
        snr1 = [snr1,round(10*log10((prx-pn0)/pn0),2)];

    end 
    fprintf('[')
    for k = 1:1:4
        fprintf('%g, ',snr1(k));
    end 
    fprintf('%g]\n',snr1(5));
end 



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
function x_n = ofdm(K1)
    bits_TX1 = ["111111111111","111111111111","111111111111"];
    x_n = [(0.9+0.9*j)*ones(1,7)];
    for k123 = bits_TX1 
        bits_TX = char(k123);
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
end 
function x_n = gfdm(N,K,M,T,alpha,Fs)
%%%%%%%%%%%%%%%%%%%%%%%%% FILTRO FORMADOR DE PULSO %%%%%%%%%%%%%%%%%%%%%%%%
sinc_1 = @(t,T) sinc(t./T);
cos_1  = @(t,T,alpha) cos((pi*alpha/T).*t);
f_1    = @(t,T,alpha) 1- ((2*alpha/T).^2).*(t.^2);
filtro = @(t,T,alpha)(sinc_1(t,T).*cos_1(t,T,alpha))./f_1(t,T,alpha);
t = (-3:2).*(1/Fs);
filtro_base = fftshift(filtro(t,T,alpha));

g_km = @(n,k,m,K1,M1) filtro_base(mod(n-m*K1,K1*M1)+1).*exp(j*((2*pi*k/K1).*n));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MODULACION GFDM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generacion de la matriz A
bits_TX1 = ["111111111111","111111111111","111111111111"];
x_n = [(0.9+0.9*j)*ones(1,7)];
for k123 = bits_TX1 
    bits_TX = char(k123);
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
               
                A(n1+1,m+M*k+1) = g_km(n1,k,m,K,M)/(K*sqrt(2));
            end 
        end 
    end 
    % Vector de simbolos
    x = half(A)*half(simbolos);         % Modulacion OFDM
    x_n1 = transpose(half(x));
    x_n1 = [x_n1(5:end),x_n1];
    x_n = [x_n,x_n1];
end
end 


