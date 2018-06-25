-- ReportToThingSpeak.lua

-- Report Data to ThingSpeak --------------------------------------------------

-- Configure Parameters
HostURL = 'api.thingspeak.com'
strOut  = 'POST /update?' 
.. 'api_key=' .. strAPI_Key
.. '&field1=' .. eStatusDHT  
.. '&field2=' .. T_Room      
.. '&field3=' .. PctHumidity 
.. '&field4=' .. CntLightIntensity1  
.. '&field5=' .. CntMotionEvents 
.. '&field6=' .. bDoorOpenLatch 
.. '&field7=' .. CntLightIntensity2 
.. ' HTTP/1.1\r\n'
.. 'Host: ' .. HostURL .. '\r\n'
.. 'Connection: close\r\n'
.. 'Accept: */*\r\n'
.. 'User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)'
.. '\r\n\r\n'

print(
     '    Door open latch  = ' .. bDoorOpenLatch    .. '\r\n'
  .. '    Motion events    = ' .. CntMotionEvents    
)

conn = nil
conn = net.createConnection(net.TCP, 0) 

conn:on('receive', function(conn, payload) end)


conn:on('connection', 
function(conn, payload) 
  conn:send(strOut)
  print('  - Update sent to ' .. HostURL .. '\r\n')
end
) 


conn:dns(HostURL,
function(conn, ip) 
  if (ip) then
    print('  - Connected to ' .. ip)
    conn:connect(80, ip)
  end
end
)

-- Reset data for cumulative variables each time data is posted
bDoorOpenLatchPrev = bDoorOpenLatch
bDoorOpenLatch     = 0
CntLoops           = 0
CntMotionEvents    = 0