class UTTweaks_Content extends UWindowDialogClientWindow;

var UTTweaks_Settings Settings;

var UTTComboControl BioRifleTweaks;
var UTTComboControl ShockBeamTweaks;
var UTTComboControl ShockProjectileTweaks;
var UTTComboControl ShockComboTweaks;
var UTTComboControl PulsePrimaryTweaks;
var UTTComboControl PulseBeamTweaks;
var UTTComboControl FlakCannonTweaks;

var UWindowCheckbox RocketLauncherSmokeTweaks;
var UWindowCheckbox StopRocketRotationTweaks;
var UWindowCheckbox ShellCaseTweaks;
var UWindowCheckbox RemoveWeaponShake;
var UWindowCheckbox BrighterPickups;
var UWindowCheckbox SimplePickupMessages;
var UWindowCheckbox SimpleFragMessages;

var UWindowSmallButton ToggleAllButton;
var UWindowLabelControl InfoLabel;

var float PaddingX;
var float PaddingY;
var float LineSpacing;
var float ControlOffset;

function Created() {
    local float ControlWidth;

    Super.Created();

    ControlOffset = PaddingY;
    ControlWidth = WinWidth - 2 * PaddingX;

    BioRifleTweaks = UTTComboControl(CreateControl(class'UTTComboControl', PaddingX, ControlOffset, ControlWidth, 1));
    BioRifleTweaks.SetText("Bio Rifle Style");
    BioRifleTweaks.SetHelpText("Select a style for the Bio Rifle");
    BioRifleTweaks.SetFont(F_Normal);
    BioRifleTweaks.Align = TA_Left;
    BioRifleTweaks.AddItem("Default");
    BioRifleTweaks.AddItem("Blue");
    BioRifleTweaks.AddItem("Cyan");
    BioRifleTweaks.AddItem("Red");
    BioRifleTweaks.AddItem("Yellow");
    ControlOffset += LineSpacing;

    ShockBeamTweaks = UTTComboControl(CreateControl(class'UTTComboControl', PaddingX, ControlOffset, ControlWidth, 1));
    ShockBeamTweaks.SetText("Shock Beam Style");
    ShockBeamTweaks.SetHelpText("Select a Shock Beam style");
    ShockBeamTweaks.SetFont(F_Normal);
    ShockBeamTweaks.Align = TA_Left;
    ShockBeamTweaks.AddItem("Default");
    ShockBeamTweaks.AddItem("Light Blue");
    ShockBeamTweaks.AddItem("Cyan");
    ShockBeamTweaks.AddItem("Red");
    ShockBeamTweaks.AddItem("Green");
    ShockBeamTweaks.AddItem("Orange");
    ControlOffset += LineSpacing;

    ShockProjectileTweaks = UTTComboControl(CreateControl(class'UTTComboControl', PaddingX, ControlOffset, ControlWidth, 1));
    ShockProjectileTweaks.SetText("Shock Projectile Style");
    ShockProjectileTweaks.SetHelpText("Select a Shock Projectile style");
    ShockProjectileTweaks.SetFont(F_Normal);
    ShockProjectileTweaks.Align = TA_Left;
    ShockProjectileTweaks.AddItem("Default");
    ShockProjectileTweaks.AddItem("Static");
    ShockProjectileTweaks.AddItem("Static Cyan");
    ShockProjectileTweaks.AddItem("Red");
    ShockProjectileTweaks.AddItem("Green");
    ShockProjectileTweaks.AddItem("Unreal");
    ControlOffset += LineSpacing;

    ShockComboTweaks = UTTComboControl(CreateControl(class'UTTComboControl', PaddingX, ControlOffset, ControlWidth, 1));
    ShockComboTweaks.SetText("Shock Combo Style");
    ShockComboTweaks.SetHelpText("Select a Shock Combo style");
    ShockComboTweaks.SetFont(F_Normal);
    ShockComboTweaks.Align = TA_Left;
    ShockComboTweaks.AddItem("Default");
    ShockComboTweaks.AddItem("Light");
    ShockComboTweaks.AddItem("Fire");
    ShockComboTweaks.AddItem("Thunder");
    ShockComboTweaks.AddItem("Radial");
    ControlOffset += LineSpacing;

    PulsePrimaryTweaks = UTTComboControl(CreateControl(class'UTTComboControl', PaddingX, ControlOffset, ControlWidth, 1));
    PulsePrimaryTweaks.SetText("Pulse Primary Style");
    PulsePrimaryTweaks.SetHelpText("Select a style for Pulse primary fire");
    PulsePrimaryTweaks.SetFont(F_Normal);
    PulsePrimaryTweaks.Align = TA_Left;
    PulsePrimaryTweaks.AddItem("Default");
    PulsePrimaryTweaks.AddItem("Cyan");
    PulsePrimaryTweaks.AddItem("Static");
    ControlOffset += LineSpacing;

    PulseBeamTweaks = UTTComboControl(CreateControl(class'UTTComboControl', PaddingX, ControlOffset, ControlWidth, 1));
    PulseBeamTweaks.SetText("Pulse Beam Style");
    PulseBeamTweaks.SetHelpText("Select a style for the Pulse beam");
    PulseBeamTweaks.SetFont(F_Normal);
    PulseBeamTweaks.Align = TA_Left;
    PulseBeamTweaks.AddItem("Default");
    PulseBeamTweaks.AddItem("Reduced");
    ControlOffset += LineSpacing;

    FlakCannonTweaks = UTTComboControl(CreateControl(class'UTTComboControl', PaddingX, ControlOffset, ControlWidth, 1));
    FlakCannonTweaks.SetText("Flak Cannon Style");
    FlakCannonTweaks.SetHelpText("Select a style for the Flak Cannon");
    FlakCannonTweaks.SetFont(F_Normal);
    FlakCannonTweaks.Align = TA_Left;
    FlakCannonTweaks.AddItem("Default");
    FlakCannonTweaks.AddItem("Yellow");
    FlakCannonTweaks.AddItem("Cyan");
    FlakCannonTweaks.AddItem("Light Purple");
    FlakCannonTweaks.AddItem("Dark Purple");
    ControlOffset += LineSpacing;

    RocketLauncherSmokeTweaks = UWindowCheckbox(CreateControl(class'UWindowCheckbox', PaddingX, ControlOffset, ControlWidth, 1));
    RocketLauncherSmokeTweaks.SetText("Reduce Rocket Smoke");
    RocketLauncherSmokeTweaks.SetHelpText("Reduces the amount of smoke from rockets");
    RocketLauncherSmokeTweaks.SetFont(F_Normal);
    RocketLauncherSmokeTweaks.Align = TA_Left;
    ControlOffset += LineSpacing;

    StopRocketRotationTweaks = UWindowCheckbox(CreateControl(class'UWindowCheckbox', PaddingX, ControlOffset, ControlWidth, 1));
    StopRocketRotationTweaks.SetText("Stop Rocket Rotation");
    StopRocketRotationTweaks.SetHelpText("Stops rockets from rotating");
    StopRocketRotationTweaks.SetFont(F_Normal);
    StopRocketRotationTweaks.Align = TA_Left;
    ControlOffset += LineSpacing;

    ShellCaseTweaks = UWindowCheckbox(CreateControl(class'UWindowCheckbox', PaddingX, ControlOffset, ControlWidth, 1));
    ShellCaseTweaks.SetText("Hide Shell Casings");
    ShellCaseTweaks.SetHelpText("Hides shell casings from minigun");
    ShellCaseTweaks.SetFont(F_Normal);
    ShellCaseTweaks.Align = TA_Left;
    ControlOffset += LineSpacing;

    RemoveWeaponShake = UWindowCheckbox(CreateControl(class'UWindowCheckbox', PaddingX, ControlOffset, ControlWidth, 1));
    RemoveWeaponShake.SetText("Remove Weapon Shake");
    RemoveWeaponShake.SetHelpText("Removes weapon shake when firing");
    RemoveWeaponShake.SetFont(F_Normal);
    RemoveWeaponShake.Align = TA_Left;
    ControlOffset += LineSpacing;

    BrighterPickups = UWindowCheckbox(CreateControl(class'UWindowCheckbox', PaddingX, ControlOffset, ControlWidth, 1));
    BrighterPickups.SetText("Brighter Item/Weapon Pickups");
    BrighterPickups.SetHelpText("Makes pickups unlit/brighter");
    BrighterPickups.SetFont(F_Normal);
    BrighterPickups.Align = TA_Left;
    ControlOffset += LineSpacing;

    SimplePickupMessages = UWindowCheckbox(CreateControl(class'UWindowCheckbox', PaddingX, ControlOffset, ControlWidth, 1));
    SimplePickupMessages.SetText("Simple Pickup Messages");
    SimplePickupMessages.SetHelpText("Shortens pickup messages");
    SimplePickupMessages.SetFont(F_Normal);
    SimplePickupMessages.Align = TA_Left;
    ControlOffset += LineSpacing;

    SimpleFragMessages = UWindowCheckbox(CreateControl(class'UWindowCheckbox', PaddingX, ControlOffset, ControlWidth, 1));
    SimpleFragMessages.SetText("Simple Frag Messages");
    SimpleFragMessages.SetHelpText("Shortens frag/kill messages");
    SimpleFragMessages.SetFont(F_Normal);
    SimpleFragMessages.Align = TA_Left;
    ControlOffset += LineSpacing;

    ControlOffset += 8;

    ToggleAllButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', PaddingX, ControlOffset, 150, 16));
    ToggleAllButton.SetText("Toggle On/Off All Tweaks");
    ToggleAllButton.SetHelpText("Enable or disable all tweaks at once");
    ControlOffset += LineSpacing;

    InfoLabel = UWindowLabelControl(CreateControl(class'UWindowLabelControl', PaddingX, ControlOffset, ControlWidth, 1));
    InfoLabel.SetText("*Changes apply after reconnect");
    InfoLabel.SetFont(F_Normal);
    InfoLabel.Align = TA_Center;

    ControlOffset += PaddingY;

    Load();
}

function AfterCreate() {
    Super.AfterCreate();
    DesiredWidth = 220;
    DesiredHeight = ControlOffset;
}

function BeforePaint(Canvas C, float X, float Y) {
    local float ControlWidth;
    local float ButtonWidth;

    Super.BeforePaint(C, X, Y);

    ControlWidth = WinWidth - 2 * PaddingX;

    BioRifleTweaks.SetSize(ControlWidth, BioRifleTweaks.WinHeight);
    ShockBeamTweaks.SetSize(ControlWidth, ShockBeamTweaks.WinHeight);
    ShockProjectileTweaks.SetSize(ControlWidth, ShockProjectileTweaks.WinHeight);
    ShockComboTweaks.SetSize(ControlWidth, ShockComboTweaks.WinHeight);
    PulsePrimaryTweaks.SetSize(ControlWidth, PulsePrimaryTweaks.WinHeight);
    PulseBeamTweaks.SetSize(ControlWidth, PulseBeamTweaks.WinHeight);
    FlakCannonTweaks.SetSize(ControlWidth, FlakCannonTweaks.WinHeight);

    RocketLauncherSmokeTweaks.SetSize(ControlWidth, 1);
    StopRocketRotationTweaks.SetSize(ControlWidth, 1);
    ShellCaseTweaks.SetSize(ControlWidth, 1);
    RemoveWeaponShake.SetSize(ControlWidth, 1);
    BrighterPickups.SetSize(ControlWidth, 1);
    SimplePickupMessages.SetSize(ControlWidth, 1);
    SimpleFragMessages.SetSize(ControlWidth, 1);

    ToggleAllButton.AutoWidth(C);
    ButtonWidth = ToggleAllButton.WinWidth;
    ToggleAllButton.WinLeft = PaddingX + (ControlWidth - ButtonWidth) / 2;

    InfoLabel.SetSize(ControlWidth, InfoLabel.WinHeight);
}

function FindSettings() {
    local UTTweaks_ClientRep Rep;

    foreach GetPlayerOwner().ChildActors(class'UTTweaks_ClientRep', Rep) {
        if (Rep != none && Rep.Settings != none) {
            Settings = Rep.Settings;
            return;
        }
    }

    if (Settings == none)
        Settings = class'UTTweaks_Settings'.static.LoadSettings();
}

function Load() {
    if (Settings == none)
        FindSettings();

    if (Settings == none)
        return;

    BioRifleTweaks.SetValue(Settings.BioRifleTweaks);
    ShockBeamTweaks.SetValue(Settings.ShockBeamTweaks);
    ShockProjectileTweaks.SetValue(Settings.ShockProjectileTweaks);
    ShockComboTweaks.SetValue(Settings.ShockComboTweaks);
    PulsePrimaryTweaks.SetValue(Settings.PulsePrimaryTweaks);
    PulseBeamTweaks.SetValue(Settings.PulseBeamTweaks);
    FlakCannonTweaks.SetValue(Settings.FlakCannonTweaks);

    RocketLauncherSmokeTweaks.bChecked = Settings.RocketLauncherSmokeTweaks;
    StopRocketRotationTweaks.bChecked = Settings.StopRocketRotationTweaks;
    ShellCaseTweaks.bChecked = Settings.ShellCaseTweaks;
    RemoveWeaponShake.bChecked = Settings.RemoveWeaponShake;
    BrighterPickups.bChecked = Settings.BrighterPickups;
    SimplePickupMessages.bChecked = Settings.SimplePickupMessages;
    SimpleFragMessages.bChecked = Settings.SimpleFragMessages;

    UpdateControlStates();
}

function Save() {
    if (Settings == none)
        FindSettings();

    if (Settings == none)
        return;

    Settings.BioRifleTweaks = BioRifleTweaks.GetValue();
    Settings.ShockBeamTweaks = ShockBeamTweaks.GetValue();
    Settings.ShockProjectileTweaks = ShockProjectileTweaks.GetValue();
    Settings.ShockComboTweaks = ShockComboTweaks.GetValue();
    Settings.PulsePrimaryTweaks = PulsePrimaryTweaks.GetValue();
    Settings.PulseBeamTweaks = PulseBeamTweaks.GetValue();
    Settings.FlakCannonTweaks = FlakCannonTweaks.GetValue();

    Settings.RocketLauncherSmokeTweaks = RocketLauncherSmokeTweaks.bChecked;
    Settings.StopRocketRotationTweaks = StopRocketRotationTweaks.bChecked;
    Settings.ShellCaseTweaks = ShellCaseTweaks.bChecked;
    Settings.RemoveWeaponShake = RemoveWeaponShake.bChecked;
    Settings.BrighterPickups = BrighterPickups.bChecked;
    Settings.SimplePickupMessages = SimplePickupMessages.bChecked;
    Settings.SimpleFragMessages = SimpleFragMessages.bChecked;

    Settings.SaveConfig();
    class'UTTweaks'.static.ApplyAllTweaksFromSettings(Settings);

    GetPlayerOwner().ClientMessage("UTTweaks: Settings saved!");
}

function UpdateControlStates() {
    local bool bDisabled;

    if (Settings == none)
        FindSettings();

    bDisabled = (Settings == none) || !Settings.bEnabled;

    BioRifleTweaks.bDisabled = bDisabled;
    ShockBeamTweaks.bDisabled = bDisabled;
    ShockProjectileTweaks.bDisabled = bDisabled;
    ShockComboTweaks.bDisabled = bDisabled;
    PulsePrimaryTweaks.bDisabled = bDisabled;
    PulseBeamTweaks.bDisabled = bDisabled;
    FlakCannonTweaks.bDisabled = bDisabled;
    RocketLauncherSmokeTweaks.bDisabled = bDisabled;
    StopRocketRotationTweaks.bDisabled = bDisabled;
    ShellCaseTweaks.bDisabled = bDisabled;
    RemoveWeaponShake.bDisabled = bDisabled;
    BrighterPickups.bDisabled = bDisabled;
    SimplePickupMessages.bDisabled = bDisabled;
    SimpleFragMessages.bDisabled = bDisabled;
}

function Notify(UWindowDialogControl C, byte E) {
    Super.Notify(C, E);

    if (E == DE_Click && C == ToggleAllButton) {
        if (Settings == none)
            FindSettings();

        if (Settings != none) {
            Settings.bEnabled = !Settings.bEnabled;
            Settings.SaveConfig();
            UpdateControlStates();
            class'UTTweaks'.static.ApplyAllTweaksFromSettings(Settings);
        }
    }
}

defaultproperties
{
    PaddingX=15
    PaddingY=15
    LineSpacing=20
}
