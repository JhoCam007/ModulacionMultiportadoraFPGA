import csv
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import norm

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

dis = ["10cm","14cm","18cm","22cm","26cm"]
bers_ofdm = []
err_ofdm  = [] 
for k in dis:
    archivo_csv = f'OFDM_{k}.csv'
    with open(archivo_csv, newline='') as file:
        reader = csv.reader(file)
        for row in reader:
            vec = np.array(np.float32(row))
    pos = np.where(vec<0.45)
    media, inError = intervalo_conf(vec[pos], 0.95)
    bers_ofdm.append(media)
    err_ofdm.append(inError)
vec = zip(bers_ofdm,[15.4, 11.94, 10.6, 8.54, 6.27],err_ofdm)
with open('OFDM.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(vec)

bers_gfdm = []
err_gfdm  = [] 
for k in dis:
    archivo_csv = f'GFDM_{k}.csv'
    with open(archivo_csv, newline='') as file:
        reader = csv.reader(file)
        for row in reader:
            vec = np.array(np.float32(row))
    pos = np.where(vec <0.45)
    media, inError = intervalo_conf(vec[pos], 0.95)
    bers_gfdm.append(media)
    err_gfdm.append(inError)

vec = zip(bers_gfdm,[16.01, 12.78, 10.47, 9.22, 6.83],err_gfdm)
with open('GFDM.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(vec)

plt.figure()

x= np.array([16.01, 12.78, 10.47, 9.22, 6.83])

plt.plot(x, bers_gfdm, marker='o')
plt.errorbar(x, bers_gfdm, yerr=err_gfdm, xuplims=4, fmt='none', ecolor='black', capsize=4, label='both limits (default)')
x = np.array([15.4, 11.94, 10.6, 8.54, 6.27])

plt.plot(x, bers_ofdm, marker='o')
plt.errorbar(x, bers_ofdm, yerr=err_gfdm, xuplims=4, fmt='none', ecolor='black', capsize=4, label='both limits (default)')

plt.legend(['GFDM','OFDM'])

plt.title("Bit Error Rate") #fontsize=30
plt.ylabel("BER")
plt.grid()
plt.yscale('log')
plt.show()
    
        