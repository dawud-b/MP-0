onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib mp0_opt

do {wave.do}

view wave
view structure
view signals

do {mp0.udo}

run -all

quit -force
