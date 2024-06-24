# ModulacionMultiportadoraFPGA
Implementación de un sistema de transmisión multiportadora sobre una plataforma FPGA

El repositorio contiene los archivos de descripción de hardware para la tarjeta FPGA, y los resultados del experimento 2 de la evaluación de los sistemas de modulación multiportadora OFDM y GFDM, estructurados de la siguiente forma:

* OFDM: Incluye los programas de descripción de hardware en VHDL para la tarjeta STEMlab 125-14, abarcando todo el proyecto para de modulación OFDM junto con los archivos IP CORE.
* GFDM: Contiene los archivos de descripción de hardware escritos en VHDL para la tarjeta STEMlab 125-14, abarcando todo el proyecto para de modulación GFDM junto con los archivos IP CORE.
* EV_TESIS: Contiene dos subdirectorios:
  * Resultados: Contiene los resultados del experimento 2, es decir los valor de BER para modulación en sus diferentes distancias de separación.
  * Software: Posee los programas de python y matlab utilizados para la evaluación del sistema.
