#SingleInstance Force
SetTitleMatchMode(2)

SetTimer(CheckBrowserAndTab,1000) ; check every 1 second (1000 milliseconds)
interval := 500 ; set the interval for the right arrow key, in milliseconds

CheckBrowserAndTab()
{ ; V1toV2: Added bracket
    ErrorLevel := ProcessExist("msedge.exe") ; check if Microsoft Edge is open
    if (ErrorLevel) {
        currentTab := WinGetTitle("ahk_exe msedge.exe") ; get the active tab title
        if (InStr(currentTab, "Tinder")) { ; check if the tab title contains the word "Tinder"
            activeWindow := WinGetID("A") ; get the active window ID
            edgeWindow := WinGetID("ahk_exe msedge.exe") ; get the Microsoft Edge window ID
            if (activeWindow = edgeWindow) { ; check if Microsoft Edge is focused
                PressRightArrow()
            }
        }
    }
return
} ; V1toV2: Added bracket before function

PressRightArrow() {
    SetTimer(SendRightArrow,interval)
}

SendRightArrow()
{ ; V1toV2: Added bracket
    SendInput("{Right}") ; send the right arrow key input
    SetTimer(SendRightArrow,0) ; turn off the timer after sending the key input, preventing continuous sending
return
} ; V1toV2: Added bracket in the end


