clear; clc; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% LECTURA_DATOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = fopen('verosimilitud (6).dat', 'rb');
values = fread(f, Inf, 'float');

complex_v = values(1:2:end) + values(2:2:end)*i;
complex_v(complex_v == 0+0j) = [];

cantidad_valores = length(complex_v);
filas = cantidad_valores/6;

matriz = reshape(complex_v,6,filas).';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           codeword tx ORDENADOS
bits_TX1 = ["010000111011" , "000011011000" , "101101011000" , "011011111100" , "010110111000" , "010001101101" , "011101101110" , "100101110110" , "101001111000" , "000010111011" , "110010000001" , "000010001110" , "011111110000" , "100111100110" , "111111101100" , "000000001010" , "001001110011" , "110010111100" , "001010111110" , "000000001010" , "000111111001" , "111010100010" , "111011010010" , "010110000010" , "110001101011" , "001001011010" , "110011010100" , "110010100110" , "011111011000" , "110111011100" , "100010010001" , "110011001010" , "010111110001" , "100100001000" , "100001100001" , "000111101111" , "111111100101" , "101001110010" , "110100000100" , "010000000111" , "100110110101" , "111111100100" , "101101111000" , "101011110011" , "110111101011" , "100100100101" , "000000010111" , "001000111110" , "011101011011" , "101001101001" , "001101010001" , "101111010000" , "101011101000" , "110001111011" , "001111100011" , "000110110110" , "010001011111" , "001110111000" , "111101111100" , "100001001100"];
simbolos=[];
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
filas1 = length(simbolos);
matriz1 = reshape(simbolos,6,filas1/6).';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rows_equal = ismember(matriz, [10,10,10,10,10,10], 'rows');

% Obtener los índices de las filas que son iguales a v
pos = find(rows_equal);

select_tx=1;  % Se selecciona el numero de transmision que se quiera evaluar

num_simbolos_rx = pos(select_tx+1)-pos(select_tx)-1;
A = matriz(pos(select_tx)+1:pos(select_tx+1)-1,:);
num_codewords = length(A);
bits_err = 0; 
for k = 1:num_codewords
    v1 = conj(matriz1(k,:)); 
    v2 = A(k,:).*v1;
    v3 = angle(v2);
    v3 = rad2deg(abs(v3));
    bits_err = bits_err + sum(v3 == 90) + 2*sum(v3 == 180);
end
ber = (bits_err)/(2*6*num_codewords);
disp(['El valor del BER es: ', num2str(ber), ' con respecto a la ', num2str(select_tx),' trasnmision']);
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

