#Persistent
#SingleInstance, Force
SetTitleMatchMode, 2

SetTimer, CheckBrowserAndTab, 1000 ; check every 1 second (1000 milliseconds)
interval := 5000 ; set the interval for the right arrow key, in milliseconds

CheckBrowserAndTab:
    Process, Exist, msedge.exe ; check if Microsoft Edge is open
    if (ErrorLevel) {
        WinGetTitle, currentTab, ahk_exe msedge.exe ; get the active tab title
        if (InStr(currentTab, "Tinder")) { ; check if the tab title contains the word "Tinder"
            WinGet, activeWindow, ID, A ; get the active window ID
            WinGet, edgeWindow, ID, ahk_exe msedge.exe ; get the Microsoft Edge window ID
            if (activeWindow = edgeWindow) { ; check if Microsoft Edge is focused
                PressRightArrow()
            }
        }
    }
return

PressRightArrow() {
    SetTimer, SendRightArrow, %interval%
}

SendRightArrow:
    SendInput, {Right} ; send the right arrow key input
    SetTimer, SendRightArrow, Off ; turn off the timer after sending the key input, preventing continuous sending
return
