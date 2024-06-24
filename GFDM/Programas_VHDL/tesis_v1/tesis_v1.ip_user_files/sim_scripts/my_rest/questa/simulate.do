onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib my_rest_opt

do {wave.do}

view wave
view structure
view signals

do {my_rest.udo}

run -all

quit -force
