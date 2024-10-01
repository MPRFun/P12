#NoEnv 
#persistent
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Pixel, Screen
SoundBeep, 300, 200
SoundBeep, 400, 200

;HOTKEYS
		
key_Space    := 	"F2"		; space bar will keep pressing when pressed this button
key_off		:= 	"F3"		; self explanatory	

break

;DO NOT TOUCH?
Gui,2:Font,Cdefault,Fixedsys
Gui,2:Color,Black
Gui,2:Color, EEAA99
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundGreen vC3
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB3 gStart,ACTIVE
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundGreen vC2
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB2 gStart,ACTIVE
Gui,2:Add,Progress, xp yp wp hp Disabled BackgroundRED vC1
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB1 gStart,OFF
Gui,2: Show, x10 y1 w200 h60
Gui 2:+LastFound +ToolWindow +AlwaysOnTop -Caption
WinSet, TransColor, EEAA99
2Guiescape:
2Guiclose:
leftbound:= A_ScreenWidth/2-pixel_box
rightbound:= A_ScreenWidth/2+pixel_box
topbound:= A_ScreenHeight/2-pixel_box
bottombound:= A_ScreenHeight/2+pixel_box 
Hotkey, % key_Space, Space
hotkey, %key_off%, offloop
return
start:
gui,2:submit,nohide
terminate:
SoundBeep, 300, 200
SoundBeep, 200, 200
Sleep 400
exitapp
stayon:
SoundBeep, 300, 200
settimer, loop2, off
settimer, loop1, 100
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: show,B3
GuiControl,2: show,C3
return
holdmode:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, 100
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: show,B2
GuiControl,2: show,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
return
offloop:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, off
GuiControl,2: show,B1
GuiControl,2: show,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
return
guihide:
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
return


loop1:
return

loop2:
While GetKeyState(key_hold, "P"){
}
return

loop

space:
SoundBeep, 300, 200
settimer, 
settimer, 
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: show,B2
GuiControl,2: show,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3

toggle := !toggle
return
#if toggle
*~$F2::
{
	If !GetKeyState("Space", "P")
		
	SendInput, {Space}
#if
}
sleep %tap_time%
return