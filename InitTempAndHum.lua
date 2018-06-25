-- InitTempAndHum.lua

-- Motion Sensor --------------------------------------------------------------

-- ePinTempAndHum defined in init.lua
gpio.mode(ePinTempAndHum, gpio.INPUT, gpio.PULLUP)