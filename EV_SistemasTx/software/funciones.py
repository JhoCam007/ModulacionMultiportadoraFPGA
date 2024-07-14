# -*- coding: utf-8 -*-
"""
Created on Fri Jun  7 09:41:49 2024

@author: Jhonatan
"""

import numpy as np
from scipy.stats import norm

def tabla_mapeo():
    # Tabla de mapeo para modulacion 4-QAM
    mapping_table = {
        (0,0) : -1+1j,
        (0,1) :  1+1j,
        (1,0) : -1-1j,
        (1,1) :  1-1j,
    }
    # mu = 2 # Cantidad de bits por simbolo
    return mapping_table

def tabla_demapeo(mapping_table):
    demapping_table = {v : k for k, v in mapping_table.items()}
    return demapping_table

def leer_datos(direccion_path):
    datos = np.fromfile(open(direccion_path), dtype=np.complex64)
    return datos

def leer_bits_tx(filename):
    data_list = []
    try:
        with open(filename, 'r') as file:
            for line in file:
                # Remover saltos de línea y espacios extra
                line = line.strip()
                
                # Convertir la línea en una lista de enteros (cada carácter es un bit)
                int_list = [int(char) for char in line]
                
                # Añadir la lista de enteros a data_list
                data_list.append(int_list)
            
            # Convertir la lista de listas en una matriz de NumPy
            mat = np.array(data_list, dtype=int)
    except FileNotFoundError:
        print(f"El archivo {filename} no fue encontrado.")
    except ValueError:
        print("El archivo contiene datos que no se pueden convertir a enteros.")
    return mat

def ordenar_reflejar(matriz):
    # Crear un array de indices que represente el nuevo orden deseado
    nuevo_orden = [10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1]
    # Aplicar el nuevo orden a cada fila de la matriz
    matriz_reordenada = matriz[:, nuevo_orden]
    return matriz_reordenada

def bit_to_sym(mapping_table, bits_tx_orden):
    mat_sym = np.empty((0, 6), dtype=complex)
    tam = bits_tx_orden.shape
    for conta in range(0, tam[0]):
        aux = bits_tx_orden[conta].reshape(6, 2)
        vec_sym = np.vstack([mapping_table[tuple(b)] for b in aux])
        mat_sym = np.vstack((mat_sym, vec_sym.flatten()))
    return mat_sym

def quitar_zeros(simbolos_rx_ceros):
    # Crear una mascara booleana donde los elementos que no son 0j son True
    mask = simbolos_rx_ceros != 0j
    # Simbolos sin ceros
    simbolos_rx_totales = simbolos_rx_ceros[mask]
    return simbolos_rx_totales

def dividir_identificador(array, identifier):
    # Encuentra los indices donde el valor es igual al identificador
    indices = np.where(array == identifier)[0]
    
    # Agrega el último índice para asegurar que el último segmento se capture completamente
    indices = np.append(indices, len(array))
    
    # Inicializa una lista para almacenar los segmentos resultantes
    result = []
    
    # Divide el array en segmentos usando los índices encontrados
    start_idx = indices[0]
    for end_idx in indices[1:]:
        # Excluye el identificador en el segmento
        if start_idx + 1 < end_idx:
            segment = array[start_idx + 1:end_idx]
            result.append(segment)
        start_idx = end_idx
    
    return result

def filtra_tx_referencia(x, reference):
    # reference = np.array([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
    # Filtra los arrays que no son iguales al sub-array de referencia
    filtered_x = np.array([sub_array for sub_array in x if not np.array_equal(sub_array, reference)])
    return filtered_x

def mat_valida_rx(tam, list_sym_rx):
    # Tamanio requerido
    tam_requerido = (tam,)
    # Filtrar los elementos que tienen el tamanio requerido
    result = [arr for arr in list_sym_rx if arr.shape == tam_requerido]
    result2 = np.array(result, dtype=np.complex64)
    return result2

def sym_to_bit(demapping_table, simbolos_rx_ordenados):
    # Requiere que simbolos_rx_ordenados sea un vector de simbolos
    bits_rx = np.vstack([demapping_table[C] for C in simbolos_rx_ordenados])
    bits_rx_vector = bits_rx.flatten()
    return bits_rx_vector

def ber(bitsTX, bitsRX):
    val_boleanos = list(bitsTX == bitsRX)
    bits_err = val_boleanos.count(False)
    return bits_err/len(bitsTX)

def mat_sym_bits(demapping_table, mat_sym_rx):
    tam = mat_sym_rx.shape
    mat_bits = np.empty((0, tam[1]*2), dtype=int)
    for conta in range(0, tam[0]):
        vec_bits = np.vstack([demapping_table[C] for C in mat_sym_rx[conta]])
        mat_bits = np.vstack((mat_bits, vec_bits.flatten()))
    return mat_bits

def ber_completos(bitsTX, mat_trans_bits_rx):
    # Calcula la matriz de comparaciones booleanas
    val_boleanos = bitsTX == mat_trans_bits_rx
    # Cuenta los bits erroneos en cada fila
    bits_err = np.sum(~val_boleanos, axis=1)
    # Calcula la proporcion de errores para cada fila
    aux = bits_err / len(bitsTX)
    return aux

def intervalo_conf(datos, nivel_confianza):
    # Calcula el valor de alpha, que representa la probabilidad de error
    alpha = 1-nivel_confianza
    # Calcula el valor critico z para el intervalo de confianza utilizando
    # la funcion percent-point function (ppf), que es la inversa de la funcion
    # de distribucion acumulativa (CDF)
    z = norm.ppf(1 - alpha/2)
    # Media de datos
    media = np.mean(datos)
    # Margen de error del intervalo de confianza
    error  = z*(np.std(datos)/np.sqrt(len(datos)))
    return media, error
