onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib acumulador_opt

do {wave.do}

view wave
view structure
view signals

do {acumulador.udo}

run -all

quit -force
