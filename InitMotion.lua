-- InitMotion.lua

-- Motion Sensor --------------------------------------------------------------

-- ePinMotion defined in init.lua
gpio.mode(ePinMotion, gpio.INT)

print('Initialize motion sensor')

gpio.trig(ePinMotion, 'up', 
  function()
    CntMotionEvents = CntMotionEvents + 1
    print('Motion event: ' .. CntMotionEvents )
    if CntMotionEvents > CntMotionThrsh and CntLoopUpdate == CntSlowLoop then
      CntLoopUpdate = CntFastLoop
      print('  Set report loop to fast counts = ' .. CntLoopUpdate)
    end
  end
)