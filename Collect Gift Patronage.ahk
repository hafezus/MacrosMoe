#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;ArmanDoesStuff 2020
;records mouse clicks and repeats them a desired amount of times
;ctrl+r to record, ctrl+e to execute, esc to stop recording/playing or exit application

posX := [942, 1802]
posY := [683, 540]
timer := []
i := 3
t := 0

recording := false
playing := false

;Auto execute/Start function
;Set cord mode here otherwise user must keep window selected
CoordMode, Mouse , Screen

`::

    ;iterations := 1
        
        playing := true
        l := i
        ;also have to check "playing" here otherwise infinite loops never break
        while(playing = true)
        {
	    ;Click
            j := 0
            while(playing = true)
            {           
                x := posX[j]
                y := posY[j]
		if(j = 0)
		{
			Click, 942, 683
			sleep 500
			Click, 1802, 540
		}
		else
		{
			sleep 2000
		}
                Click, %x%, %y%
		j++
		j := Mod(j, 2)
            }
	
            ;iterations--
        }      

Return

Escape::    
    if(playing = true)
    {
        playing := false
        Return
    }   
    MsgBox, 0, App Closed, Exiting Application, 1
    ExitApp
Return

+s::    
    if(recording = true)
    {
        recording := false
        Return
    }
    if(playing = true)
    {
        playing := false
        Return
    }   
    MsgBox, 0, App Closed, Exiting Application, 1
    ExitApp
Return