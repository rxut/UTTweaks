class UTTComboControl extends UWindowComboControl;

var bool bDisabled;
var Color EnabledColor;
var Color DisabledColor;

var float EditBoxWidthFraction;
var float EditBoxMinWidth;
var float EditBoxMaxWidth;

function Created() {
    Super.Created();
    EnabledColor = EditBox.TextColor;
}

function AfterCreate() {
    EditBoxWidthFraction = FClamp(EditBoxWidth / WinWidth, 0.05, 0.95);
    EditBoxMinWidth = WinWidth * EditBoxWidthFraction;
    EditBoxMaxWidth = WinWidth * EditBoxWidthFraction;
}

function Resized() {
    Super.Resized();
    EditBoxWidth = FClamp(WinWidth * EditBoxWidthFraction, EditBoxMinWidth, EditBoxMaxWidth);
}

function Paint(Canvas C, float X, float Y) {
    if (bDisabled) {
        EditBox.SetTextColor(DisabledColor);
    } else {
        EditBox.SetTextColor(EnabledColor);
    }

    Super.Paint(C, X, Y);
}

function Notify(byte E) {
    if (bDisabled) {
        return;
    }

    Super.Notify(E);
}

defaultproperties
{
    DisabledColor=(R=110,G=110,B=110,A=255)
    EditBoxMinWidth=0
    EditBoxMaxWidth=65535
    EditBoxWidthFraction=0.5
}
