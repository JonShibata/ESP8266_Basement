-- Main.lua

-- Initialize lua and call monitor functions ----------------------------------

tmr.alarm(0, tLoopBaseRate, 1, 
  function ()
    if bDoorOpenLatchPrev == 0 and CntMotionEvents == 0 and CntLoopUpdate == CntFastLoop then      
      CntLoopUpdate = CntSlowLoop
      print('  Set report loop to slow counts = ' .. CntLoopUpdate)
    end

    CntLoops = CntLoops + 1
    print('CntLoops = ' .. CntLoops)
    if CntLoops + 1 >= CntLoopUpdate then
      if wifi.sta.getip() == nil then
        print('WiFi: Station Mode')
        wifi.setmode(wifi.STATION)
        wifi.sta.connect()
      end
    else -- No update: put in low power settings
      if wifi.sta.getip() ~= nil then
        print('Wifi: Null Mode')
        wifi.setmode(wifi.NULLMODE)
      end
    end
    
    if CntLoops >= CntLoopUpdate then    
      if wifi.sta.getip() == nil then
        print('Wifi not connected. No update posted.')
      else
        dofile('MonitorAnalog.lua')
        dofile('MonitorTempAndHum.lua')
        -- Wait for the updates
        tmr.alarm(2, 600, 0, 
          function()
            dofile('ReportToThingSpeak.lua')
          end
        )
      end
    end
  end
)
