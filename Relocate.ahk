#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;ArmanDoesStuff 2020
;records mouse clicks and repeats them a desired amount of times
;ctrl+r to record, ctrl+e to execute, esc to stop recording/playing or exit application

posX := [1007, 883]
posY := [671, 693]
timer := []
i := 3
t := 0

recording := false
playing := false

;Auto execute/Start function
;Set cord mode here otherwise user must keep window selected
CoordMode, Mouse , Screen

`::

    iterations := 1
        
        playing := true
        l := i
        ;also have to check "playing" here otherwise infinite loops never break
        while(iterations != 0 && playing = true)
        {
	    Click
            j := 1
            while(j < l && playing = true)
            {           
                x := posX[j]
                y := posY[j]
		if(j = 1)
		{
		sleep 520
		}
		else
		{
		sleep 250
		}
                Click, %x%, %y%
                j++
            }
	
            iterations--
        }      

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