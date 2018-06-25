-- MonitorDoor.lua

-- Door Sensor ----------------------------------------------------------------

-- Configure parameters
fBeep             = 2     -- (Hz) Beep frequency 
DC_Beep           = 512   -- Beep duty cycle (1023 is max value)

-- ePinDoor and ePinBeep defined in init.lua
gpio.mode(ePinDoor, gpio.INT, gpio.PULLUP)
pwm.setup(ePinBeep, fBeep, DC_Beep)

function DoorActions()
  if gpio.read(ePinDoor) == 1 then 
    -- Door opened
    print('Door open\r\n  Starting Beep')
    bDoorOpen = 1
    bDoorOpenLatch = 1
    tmr.alarm(3, 10000, 0, function() pwm.start(ePinBeep) end)
  
    if CntLoopUpdate == CntSlowLoop then
      CntLoopUpdate = CntFastLoop
      print('  Set report loop to fast counts = ' .. CntLoopUpdate)
    end
  else 
    -- Door closed      
    print('Door closed')
    bDoorOpen   = 0
    tmr.stop(3)
    pwm.stop(ePinBeep)
  end
end

print('Monitoring door sensor')
gpio.trig(ePinDoor, 'both', 
  function()
    DoorActions()
  end
)

DoorActions()