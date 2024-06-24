clear; clc; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% LECTURA_DATOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = fopen('verosimilitud.dat', 'rb');
values = fread(f, Inf, 'float');

complex_v = values(100e6+1:2:end) + values(100e6+2:2:end)*i;
complex_v(complex_v == 0) = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%1054017
bits_TX1 = ["111111111111","111111111111","111111111111"];
simbolos = [];
for k123 = bits_TX1 
    bits_TX = char(k123);
% bits_TX = '101001111011111010100001101000110001';
    val_1 = 11; 
    val_2 = 12;
       
    simbolos1 = [];
    for k = 1:6
        mapeo = mapeo_bits(bits_TX(val_1:val_2));
        val_1 =  val_1 -2;
        val_2 =  val_2 - 2; 
        simbolos1=[simbolos1;mapeo];
    end
    simbolos=[simbolos;simbolos1];
end
% Calcular la correlación cruzada
[c, lags] = xcorr(complex_v,simbolos);

% Encontrar el índice de la máxima correlación
indice_mejor_coincidencia = find(abs(c)==max(abs(c)));


% Obtener el lag correspondiente a la mejor coincidencia
lag_mejor_coincidencia = lags(indice_mejor_coincidencia)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bits_TX = ["010000111011" , "000011011000" , "101101011000" , "011011111100" , "010110111000" , "010001101101" , "011101101110" , "100101110110" , "101001111000" , "000010111011" , "110010000001" , "000010001110" , "011111110000" , "100111100110" , "111111101100" , "000000001010" , "001001110011" , "110010111100" , "001010111110" , "000000001010" , "000111111001" , "111010100010" , "111011010010" , "010110000010" , "110001101011" , "001001011010" , "110011010100" , "110010100110" , "011111011000" , "110111011100" , "100010010001" , "110011001010" , "010111110001" , "100100001000" , "100001100001" , "000111101111" , "111111100101" , "101001110010" , "110100000100" , "010000000111" , "100110110101" , "111111100100" , "101101111000" , "101011110011" , "110111101011" , "100100100101" , "000000010111" , "001000111110" , "011101011011" , "101001101001" , "001101010001" , "101111010000" , "101011101000" , "110001111011" , "001111100011" , "000110110110" , "010001011111" , "001110111000" , "111101111100" , "100001001100" , "111111111111" , "111111111111" , "111111111111"]
simbolos = [];
for k123 = bits_TX 
    bits_TX = char(k123);
% bits_TX = '101001111011111010100001101000110001';
    val_1 = 11; 
    val_2 = 12;
       
    simbolos1 = [];
    for k = 1:6
        mapeo = mapeo_bits(bits_TX(val_1:val_2));
        val_1 =  val_1 -2;
        val_2 =  val_2 - 2; 
        simbolos1=[simbolos1;mapeo];
    end
    simbolos=[simbolos;simbolos1];
end

num_elem_vector = length(simbolos);
muestra = complex_v(lag_mejor_coincidencia+1+18:lag_mejor_coincidencia+1+18+num_elem_vector-1);
valores_coincidentes = [muestra == simbolos]; 

ber = (num_elem_vector-sum(valores_coincidentes))/num_elem_vector
ber/2
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

