class UTTweaks_Settings extends Object
    config(UTTweaks)
    perobjectconfig;

var config bool bEnabled;

var config string BioRifleTweaks;
var config string ShockBeamTweaks;
var config string ShockProjectileTweaks;
var config string ShockComboTweaks;
var config string PulsePrimaryTweaks;
var config string PulseBeamTweaks;
var config string FlakCannonTweaks;

var config bool RocketLauncherSmokeTweaks;
var config bool StopRocketRotationTweaks;
var config bool ShellCaseTweaks;
var config bool RemoveWeaponShake;
var config bool BrighterPickups;
var config bool SimplePickupMessages;
var config bool SimpleFragMessages;

var config float MenuX;
var config float MenuY;
var config float MenuWidth;
var config float MenuHeight;

static function UTTweaks_Settings LoadSettings() {
    local Object Helper;
    local UTTweaks_Settings S;

    Helper = new(none, 'UTTweaks') class'Object';
    S = new(Helper, 'Settings') class'UTTweaks_Settings';
    S.CheckConfig();
    return S;
}

simulated function CheckConfig() {
    local bool bNeedsSave;

    // Only save if we actually set defaults
    if (BioRifleTweaks == "") { BioRifleTweaks = "Default"; bNeedsSave = true; }
    if (ShockBeamTweaks == "") { ShockBeamTweaks = "Default"; bNeedsSave = true; }
    if (ShockProjectileTweaks == "") { ShockProjectileTweaks = "Default"; bNeedsSave = true; }
    if (ShockComboTweaks == "") { ShockComboTweaks = "Default"; bNeedsSave = true; }
    if (PulsePrimaryTweaks == "") { PulsePrimaryTweaks = "Default"; bNeedsSave = true; }
    if (PulseBeamTweaks == "") { PulseBeamTweaks = "Default"; bNeedsSave = true; }
    if (FlakCannonTweaks == "") { FlakCannonTweaks = "Default"; bNeedsSave = true; }

    if (bNeedsSave)
        SaveConfig();
}

defaultproperties
{
    bEnabled=True
    BioRifleTweaks="Default"
    ShockBeamTweaks="Default"
    ShockProjectileTweaks="Default"
    ShockComboTweaks="Default"
    PulsePrimaryTweaks="Default"
    PulseBeamTweaks="Default"
    FlakCannonTweaks="Default"
    RocketLauncherSmokeTweaks=False
    StopRocketRotationTweaks=False
    ShellCaseTweaks=False
    RemoveWeaponShake=False
    BrighterPickups=False
    SimplePickupMessages=False
    SimpleFragMessages=False
    MenuX=426
    MenuY=200
    MenuWidth=260
    MenuHeight=400
}
