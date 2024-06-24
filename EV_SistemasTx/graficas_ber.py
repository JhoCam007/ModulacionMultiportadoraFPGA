import csv
import matplotlib.pyplot as plt
import numpy as np
# Nombre del archivo CSV
archivo_csv = 'OFDM_22cm.csv'
with open(archivo_csv, newline='') as file:
    reader = csv.reader(file)
    for row in reader:
        with open(archivo_csv, newline='') as file:
            reader = csv.reader(file)
            for row in reader:
                vec = np.array(np.float32(row))

plt.plot(vec)
plt.show()
