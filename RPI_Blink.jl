rpiProc = addprocs(["julia-user@NODE-RPI3"],dir="/home/pi/.julia/bin/")

include("GPIO_Device.jl")

import GPIO_Device
using GPIO_Device

rpi = GPIO_Device.DeviceGPIO()

initialize(rpi, "RPI3.xml")

LEDPin = rpi.digital_pin["PIN07"]

remotecall_fetch(GPIO_Common.blinkLED, rpiProc[1], LEDPin)
