#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;ArmanDoesStuff 2020
;records mouse clicks and repeats them a desired amount of times
;ctrl+r to record, ctrl+e to execute, esc to stop recording/playing or exit application

posX := []
posY := []
timer := []
i := 0
t := 0

recording := false
playing := false

;Auto execute/Start function
;Set cord mode here otherwise user must keep window selected
CoordMode, Mouse , Screen
MsgBox, 0, Mouse Click Repeat, Press ctrl-r to record and ctrl-e to execute - Esc will stop record/play or close the app if nothing is no operation is active
Return

+r::            
    MsgBox, 0, Recording, Recording Starting, 1 
    playing := false        
    recording := true
    iterations := 0 
    i := 0
    t := 0
    while(recording = true)
    {
        t++
        sleep 10
    }
    MsgBox, 0, Recording, Recording completed, 2    
Return

LButton::
    Send {LButton down}
    if(recording)
    {
        MouseGetPos, x, y
        posX[i] := x
        posY[i] := y
        timer[i] := t * 10
        t = 0
        i++
    }
Return

LButton up::Send {LButton Up}

`::
    if(recording = true)
    {
        MsgBox, 0, Still recording, Press esc to finish current recording, 1
    }
    else if(i = 0)
    {
        MsgBox, 0, No recording, Please use ctrl+r to record mouse sequence, 2
    }
    else
    {   
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
                sleep 1000
                x := posX[j]
                y := posY[j]
		sleep 1000
                Click, %x%, %y%
                j++
            }
            iterations--
        }       
	sleep 6000
	run, notepad.exe
	j:=1
	while(j < l)
            {           
                sleep 500
                x := posX[j]
                y := posY[j]
		sleep 500
		send, %x%
		sleep 500
		send, %y%
		sleep 500
		send, |
                j++
            }
    }
Return

Escape::    
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