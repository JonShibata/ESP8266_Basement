-- MonitorAnalog.lua

-- Light Sensor 1 and 2 Mux -------------------------------------------------------------

CntAnalogLoop = 0
tmr.alarm(1, 100, 1, 
  function() 
    CntAnalogLoop = CntAnalogLoop + 1
    
    if CntAnalogLoop == 1  then
      gpio.write(ePinLightD1, gpio.HIGH)
      
    elseif CntAnalogLoop == 2 then
      CntLightIntensity1 = adc.read(0)  
      
    elseif CntAnalogLoop == 3 then
      gpio.write(ePinLightD1, gpio.LOW)
      gpio.write(ePinLightD2, gpio.HIGH)    
      
    elseif CntAnalogLoop == 4 then
      CntLightIntensity2 = adc.read(0)
      
    elseif CntAnalogLoop == 5 then
      gpio.write(ePinLightD2, gpio.LOW) 
      tmr.stop(1)
      print(
           '    Light intensity1 = ' .. CntLightIntensity1    .. '\r\n'
        .. '    Light intensity2 = ' .. CntLightIntensity2
      )
    end
  end
)




