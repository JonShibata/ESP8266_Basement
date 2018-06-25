-- MonitorTempAndHum.lua

-- Motion Sensor --------------------------------------------------------------

-- ePinTempAndHum defined in init.lua

for iLoop = 1, 10 do
  eStatusDHT, T_RoomTemp, PctHumidityTemp = dht.read(ePinTempAndHum)
  
  if eStatusDHT == 0 then
    T_Room      = T_RoomTemp
    PctHumidity = PctHumidityTemp
    break
  end
end


print(
     '    DHT Status       = ' .. eStatusDHT           .. '\r\n'
  .. '    Temperature      = ' .. T_Room               .. '\r\n'
  .. '    Humidity         = ' .. PctHumidity
)
