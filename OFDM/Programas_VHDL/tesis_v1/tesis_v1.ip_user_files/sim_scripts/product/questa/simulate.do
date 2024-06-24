onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib product_opt

do {wave.do}

view wave
view structure
view signals

do {product.udo}

run -all

quit -force
