class UTTweaks_Dialog extends UWindowFramedWindow;

var float MaxWinWidth;
var float MaxWinHeight;

function Created() {
    Super.Created();
    MinWinWidth = default.MinWinWidth;
    MinWinHeight = default.MinWinHeight;
}

function Resized() {
    WinWidth = FClamp(WinWidth, MinWinWidth, MaxWinWidth);
    WinHeight = FClamp(WinHeight, MinWinHeight, MaxWinHeight);
    Super.Resized();
}

function ShowWindow() {
    Super.ShowWindow();
    UTTweaks_Scroll(ClientArea).Load();
}

function Close(optional bool bByParent) {
    Super.Close(bByParent);
    if (Root.Console.IsInState('UWindow') && !Root.Console.bShowConsole)
        Root.Console.CloseUWindow();
}

defaultproperties
{
    ClientClass=class'UTTweaks_Scroll'
    WindowTitle="UT Tweaks v3.0 by rX"
    bSizable=True
    bStatusBar=True
    MinWinWidth=260
    MaxWinWidth=500
    MinWinHeight=400
    MaxWinHeight=600
}
