onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib suma_opt

do {wave.do}

view wave
view structure
view signals

do {suma.udo}

run -all

quit -force
