# Bibliotecas propias
from funciones import tabla_mapeo
from funciones import tabla_demapeo
from funciones import leer_datos
from funciones import leer_bits_tx
from funciones import ordenar_reflejar
from funciones import bit_to_sym
from funciones import quitar_zeros
from funciones import dividir_identificador
from funciones import filtra_tx_referencia
from funciones import mat_valida_rx
from funciones import sym_to_bit
from funciones import ber
from funciones import mat_sym_bits
from funciones import ber_completos
from funciones import intervalo_conf
# Bibliotecas python
import numpy as np
import matplotlib.pyplot as plt
import csv 
# Mapeo QPSK # mu: bits por simbolo
mapping_table = tabla_mapeo() # Tabla de mapeo
demapping_table = tabla_demapeo(mapping_table) #Tabla de demapeo

# Tratamiento de transmision
dir_bits = "C:/Users/Henry/Documents/EV_TESIS/bits_tx.txt"
mat_bits_tx_all = leer_bits_tx(dir_bits) # Todos los bits generados
# Matriz de bits sin codewords de referencia
mat_bits_tx = filtra_tx_referencia(mat_bits_tx_all, np.array([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]))
# Matriz de bits ordenados segun la modulacion en la FPGA -(Corregir tomar ultimas n)-
mat_bits_tx_orden = ordenar_reflejar(mat_bits_tx) # o [mat_bits_tx_all[0:60][:]]
# Matriz de simbolos ordenada segun FPGA
mat_symb_tx = bit_to_sym(mapping_table, mat_bits_tx_orden)

# Tratamiento de recepcion
lista_distancias = ["18cm","22cm","26cm"] # Colocas las distancias que quieres evaluar
mod_mc = ["OFDM"]
for mod in mod_mc:
    vec_bers = []
    vec_errs = []
    for dis in lista_distancias:
        dir_dat = f"C:/Users/Henry/Documents/EV_TESIS/{mod}/{dis}/v.dat" #directorio de archivos
        symb_rx_zeros = leer_datos(dir_dat)
        symb_rx_all = quitar_zeros(symb_rx_zeros) # Simbolos sin ceros
        # Lista con todas las transmisiones de diferentes tamanios
        list_sym_rx = dividir_identificador(symb_rx_all, 10 + 0j)
        # Matriz de simbolos con todas las transmisiones validas
        mat_trans_sym_rx = mat_valida_rx(len(mat_symb_tx.flatten()), list_sym_rx) # 360 son los simbolos totales
        # Matriz de bits con todas las transmisiones validas
        mat_trans_bits_rx = mat_sym_bits(demapping_table, mat_trans_sym_rx)
        bitsTX = mat_bits_tx_orden.flatten()
        BERs = ber_completos(bitsTX, mat_trans_bits_rx)
        pos = np.where( BERs ) 
        media, inError = intervalo_conf(BERs[pos], 0.95)
        vec_bers.append(media)
        vec_errs.append(inError)
        print(dis,media,inError)
        #columnas_concatenadas = zip(vec_bers,vec_errs)
        with open(mod+'_'+dis+'.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(BERs)
    vec = zip(vec_bers,vec_errs)
    with open(mod+'.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(vec)


