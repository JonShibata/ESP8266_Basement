-- MonitorLight.lua

-- Light Sensor ---------------------------------------------------------------

-- ePinLightD1 and ePinLightD2 defined in init.lua

gpio.mode(ePinLightD1, gpio.OUTPUT)
gpio.mode(ePinLightD2, gpio.OUTPUT)

gpio.write(ePinLightD1, gpio.LOW)
gpio.write(ePinLightD2, gpio.LOW)