onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib my_multiplicador_opt

do {wave.do}

view wave
view structure
view signals

do {my_multiplicador.udo}

run -all

quit -force
