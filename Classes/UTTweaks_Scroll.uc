class UTTweaks_Scroll extends UWindowScrollingDialogClient;

var UWindowSmallButton Btn_Save;
var UWindowSmallCloseButton Btn_Close;

var float FixedPaddingX;
var float FixedPaddingY;

function Created() {
    Super.Created();

    Btn_Save = UWindowSmallButton(FixedArea.CreateControl(
        class'UWindowSmallButton',
        FixedArea.WinWidth - FixedPaddingX - 72,
        FixedPaddingY,
        32,
        16
    ));
    Btn_Save.SetText("Save");
    Btn_Save.ToolTipString = "Save settings to UTTweaks.ini";
    Btn_Save.Register(Self);

    Btn_Close = UWindowSmallCloseButton(FixedArea.CreateControl(
        class'UWindowSmallCloseButton',
        FixedArea.WinWidth - FixedPaddingX - 32,
        FixedPaddingY,
        32,
        16
    ));

    FixedArea.WinHeight = 2 * FixedPaddingY + 16;
}

function BeforePaint(Canvas C, float X, float Y) {
    Super.BeforePaint(C, X, Y);

    Btn_Close.AutoWidth(C);
    Btn_Close.WinLeft = FixedArea.WinWidth - FixedPaddingX - Btn_Close.WinWidth;

    Btn_Save.AutoWidth(C);
    Btn_Save.WinLeft = FixedArea.WinWidth - FixedPaddingX - Btn_Close.WinWidth - 5 - Btn_Save.WinWidth;
}

function Notify(UWindowDialogControl C, byte E) {
    Super.Notify(C, E);

    if (E == DE_Click && C == Btn_Save) {
        UTTweaks_Content(ClientArea).Save();
    }
}

function Load() {
    UTTweaks_Content(ClientArea).Load();
}

function SaveConfigs() {
    local UTTweaks_Settings S;
    local UWindowWindow Dialog;

    Super.SaveConfigs();

    S = UTTweaks_Content(ClientArea).Settings;
    if (S == none)
        return;

    Dialog = GetParent(class'UWindowFramedWindow');
    if (Dialog != none) {
        S.MenuX = Dialog.WinLeft;
        S.MenuY = Dialog.WinTop;
        S.MenuWidth = Dialog.WinWidth;
        S.MenuHeight = Dialog.WinHeight;
        S.SaveConfig();
    }
}

defaultproperties
{
    ClientClass=class'UTTweaks_Content'
    FixedAreaClass=class'UWindowDialogClientWindow'
    FixedPaddingX=20
    FixedPaddingY=5
}
