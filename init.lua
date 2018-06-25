-- init.lua

-- Initialize lua and call monitor functions ----------------------------------

-- Configure Parameters
ePinDoor       = 1    -- Pin D1
ePinMotion     = 2    -- Pin D2
ePinBeep       = 3    -- Pin D3
ePinTempAndHum = 5    -- Pin D5
ePinLightD1    = 6    -- Pin D6
ePinLightD2    = 7    -- Pin D7

CntFastLoop    = 5    -- Counts of loops if door open or motion detected
CntSlowLoop    = 30   -- Counts of loops if door closed and no motion
CntMotionThrsh = 2    -- Counts of motion to trigger the fast update rate
tLoopBaseRate  = 60 * 1000 -- (ms) time of the base loop rate

strAPI_Key     = '1HIREBOZM5EV4VLJ' -- Key for ThingSpeak update

-- Initialize Variables
bDoorOpen          = 0
bDoorOpenLatch     = 0
bDoorOpenLatchPrev = 0
CntLightIntensity1 = 0
CntLightIntensity2 = 0
CntLoops           = 0
CntLoopUpdate      = CntFastLoop
CntMotionEvents    = 0
eStatusDHT         = -1
T_Room             = -1
PctHumidity        = -1

dofile('InitDoorSwitch.lua')
dofile('InitMotion.lua')
dofile('InitAnalogMux.lua')
dofile('InitTempAndHum.lua')

dofile('Main.lua')
