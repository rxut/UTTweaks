class UTTweaks extends Object;

#exec OBJ LOAD FILE=Textures\FireEffect.utx GROUP="FireEffectCustom" PACKAGE=UTTweaks LODSET=2

#exec TEXTURE IMPORT NAME=BioGooBlue FILE=Textures\Jgreen_blue.pcx PACKAGE=UTTweaks GROUP="BioGooBlue" LODSET=2
#exec TEXTURE IMPORT NAME=BioGooCyan FILE=Textures\Jgreen_cyan.PCX PACKAGE=UTTweaks GROUP="BioGooCyan" LODSET=2
#exec TEXTURE IMPORT NAME=BioGooRed FILE=Textures\Jgreen_red.PCX PACKAGE=UTTweaks GROUP="BioGooRed" LODSET=2
#exec TEXTURE IMPORT NAME=BioGooYellow FILE=Textures\Jgreen_yellow.PCX PACKAGE=UTTweaks GROUP="BioGooYellow" LODSET=2

#exec TEXTURE IMPORT NAME=ShockBeamRed FILE=Textures\shockbeam_0.pcx PACKAGE=UTTweaks GROUP="ShockBeamRed" LODSET=2
#exec TEXTURE IMPORT NAME=ShockBeamCyan FILE=Textures\ShockBeamCyan.PCX PACKAGE=UTTweaks GROUP="ShockBeamCyan" LODSET=2
#exec TEXTURE IMPORT NAME=ShockBeamGreen FILE=Textures\shockbeam_2.PCX PACKAGE=UTTweaks GROUP="ShockBeamGreen" LODSET=2
#exec TEXTURE IMPORT NAME=ShockBeamOrange FILE=Textures\shockbeam_3.PCX PACKAGE=UTTweaks GROUP="ShockBeamOrange" LODSET=2

#exec TEXTURE IMPORT NAME=ShockBallStatic FILE=Textures\ASMDAlt_a03_static.pcx PACKAGE=UTTweaks GROUP="ShockBallStatic" LODSET=2
#exec TEXTURE IMPORT NAME=ShockBallCyanStatic FILE=Textures\ASMDAlt_a03_cyan.pcx PACKAGE=UTTweaks GROUP="ShockBallCyanStatic" LODSET=2

#exec TEXTURE IMPORT NAME=ASMDAlt_0_a00 FILE=Textures\ASMDAlt_0_a00.pcx PACKAGE=UTTweaks GROUP="ShockBallRed" LODSET=2
#exec TEXTURE IMPORT NAME=ASMDAlt_0_a01 FILE=Textures\ASMDAlt_0_a01.pcx PACKAGE=UTTweaks GROUP="ShockBallRed" LODSET=2
#exec TEXTURE IMPORT NAME=ASMDAlt_0_a02 FILE=Textures\ASMDAlt_0_a02.pcx PACKAGE=UTTweaks GROUP="ShockBallRed" LODSET=2
#exec TEXTURE IMPORT NAME=ASMDAlt_0_a03 FILE=Textures\ASMDAlt_0_a03.pcx PACKAGE=UTTweaks GROUP="ShockBallRed" LODSET=2

#exec TEXTURE IMPORT NAME=ASMDAlt_2_a00 FILE=Textures\ASMDAlt_2_a00.pcx PACKAGE=UTTweaks GROUP="ShockBallGreen" LODSET=2
#exec TEXTURE IMPORT NAME=ASMDAlt_2_a01 FILE=Textures\ASMDAlt_2_a01.pcx PACKAGE=UTTweaks GROUP="ShockBallGreen" LODSET=2
#exec TEXTURE IMPORT NAME=ASMDAlt_2_a02 FILE=Textures\ASMDAlt_2_a02.pcx PACKAGE=UTTweaks GROUP="ShockBallGreen" LODSET=2
#exec TEXTURE IMPORT NAME=ASMDAlt_2_a03 FILE=Textures\ASMDAlt_2_a03.pcx PACKAGE=UTTweaks GROUP="ShockBallGreen" LODSET=2

#exec TEXTURE IMPORT NAME=Blupblst_a00 FILE=Textures\Blupblst_a00.PCX PACKAGE=UTTweaks GROUP="Effects" LODSET=2
#exec TEXTURE IMPORT NAME=Blupblst_a01 FILE=Textures\Blupblst_a01.PCX PACKAGE=UTTweaks GROUP="Effects" LODSET=2
#exec TEXTURE IMPORT NAME=Blupblst_a02 FILE=Textures\Blupblst_a02.PCX PACKAGE=UTTweaks GROUP="Effects" LODSET=2
#exec TEXTURE IMPORT NAME=Blupblst_a03 FILE=Textures\Blupblst_a03.PCX PACKAGE=UTTweaks GROUP="Effects" LODSET=2
#exec TEXTURE IMPORT NAME=Blupblst_a04 FILE=Textures\Blupblst_a04.PCX PACKAGE=UTTweaks GROUP="Effects" LODSET=2

// Reduced pulse bolt mesh
#exec MESH IMPORT MESH=PBolt_Medium ANIVFILE=Models\Pbolt_Medium_a.3d DATAFILE=Models\Pbolt_Medium_d.3d X=0 Y=0 Z=0 MLOD=False 
#exec MESH ORIGIN MESH=PBolt_Medium X=0 Y=0 Z=0 YAW=-64 PITCH=0 ROLL=0
#exec MESH SEQUENCE MESH=PBolt_Medium SEQ=ALL STARTFRAME=0 NUMFRAMES=1 RATE=30
#exec MESH SEQUENCE MESH=PBolt_Medium SEQ=Still STARTFRAME=0 NUMFRAMES=1 RATE=30
#exec MESHMAP NEW MESHMAP=PBolt_Medium MESH=PBolt_Medium
#exec MESHMAP SCALE MESHMAP=PBolt_Medium X=0.1 Y=0.1 Z=0.2

static function ApplyAllTweaksFromSettings(UTTweaks_Settings S) {
    if (S == none || !S.bEnabled) {
        ResetAllDefaults();
        return;
    }

    SetBioRifleTweaks(S.BioRifleTweaks);
    SetShockBeamTweaks(S.ShockBeamTweaks);
    SetShockProjectileTweaks(S.ShockProjectileTweaks);
    SetShockComboTweaks(S.ShockComboTweaks);
    SetPulsePrimaryTweaks(S.PulsePrimaryTweaks);
    SetPulseBeamTweaks(S.PulseBeamTweaks);
    SetFlakCannonTweaks(S.FlakCannonTweaks);
    SetRocketLauncherSmokeTweaks(S.RocketLauncherSmokeTweaks);
    StopRocketRotationTweaks(S.StopRocketRotationTweaks);
    SetShellCaseTweaks(S.ShellCaseTweaks);
    RemoveWeaponShake(S.RemoveWeaponShake);
    BrighterPickups(S.BrighterPickups);
    SimplePickupMessages(S.SimplePickupMessages);
    SimpleFragMessages(S.SimpleFragMessages);
}

static function ResetAllDefaults() {
    SetBioRifleTweaks("Default");
    SetShockBeamTweaks("Default");
    SetShockProjectileTweaks("Default");
    SetShockComboTweaks("Default");
    SetPulsePrimaryTweaks("Default");
    SetPulseBeamTweaks("Default");
    SetFlakCannonTweaks("Default");
    SetRocketLauncherSmokeTweaks(false);
    StopRocketRotationTweaks(false);
    SetShellCaseTweaks(false);
    RemoveWeaponShake(false);
    BrighterPickups(false);
    SimplePickupMessages(false);
    SimpleFragMessages(false);
}

static function SetBioRifleTweaks(string option) {
    local Texture T;

    switch (option) {
        case "Default":
            T = Texture(DynamicLoadObject("Botpack.Jgreen", class'Texture'));
            break;
        case "Blue":
            T = Texture(DynamicLoadObject("UTTweaks.BioGooBlue", class'Texture'));
            break;
        case "Cyan":
            T = Texture(DynamicLoadObject("UTTweaks.BioGooCyan", class'Texture'));
            break;
        case "Red":
            T = Texture(DynamicLoadObject("UTTweaks.BioGooRed", class'Texture'));
            break;
        case "Yellow":
            T = Texture(DynamicLoadObject("UTTweaks.BioGooYellow", class'Texture'));
            break;
    }
    if (T != none) {
        Class'bioglob'.default.Texture = T;
        Class'biosplash'.default.Texture = T;
        Class'ut_biogel'.default.Texture = T;
    }
}

static function SetShockBeamTweaks(string option) {
    local Texture T;
    local float Scale;
    local bool bHide;

    bHide = true;
    Scale = 0.24;

    switch (option) {
        case "Default":
            T = Texture(DynamicLoadObject("Botpack.Effects.jenergy2", class'Texture'));
            bHide = false;
            Scale = 0.44;
            break;
        case "Light Blue":
            T = Texture(DynamicLoadObject("UnrealShare.Effect1.FireEffect1U", class'Texture'));
            break;
        case "Cyan":
            T = Texture(DynamicLoadObject("UTTweaks.ShockBeamCyan", class'Texture'));
            break;
        case "Red":
            T = Texture(DynamicLoadObject("UTTweaks.ShockBeamRed", class'Texture'));
            break;
        case "Green":
            T = Texture(DynamicLoadObject("UTTweaks.ShockBeamGreen", class'Texture'));
            break;
        case "Orange":
            T = Texture(DynamicLoadObject("UTTweaks.ShockBeamOrange", class'Texture'));
            break;
    }
    Class'UT_RingExplosion5'.default.bHidden = bHide;
    Class'ShockBeam'.default.DrawScale = Scale;
    if (T != none)
        Class'ShockBeam'.default.Texture = T;
}

static function SetShockProjectileTweaks(string option) {
    local Texture T;

    switch (option) {
        case "Default":
            T = Texture(DynamicLoadObject("Botpack.ASMDAlt.ASMDAlt_a00", class'Texture'));
            break;
        case "Static":
            T = Texture(DynamicLoadObject("UTTweaks.ShockBallStatic", class'Texture'));
            break;
        case "Static Cyan":
            T = Texture(DynamicLoadObject("UTTweaks.ShockBallCyanStatic", class'Texture'));
            break;
        case "Red":
            T = Texture(DynamicLoadObject("UTTweaks.ASMDAlt_0_a00", class'Texture'));
            break;
        case "Green":
            T = Texture(DynamicLoadObject("UTTweaks.ASMDAlt_2_a00", class'Texture'));
            break;
        case "Unreal":
            T = Texture(DynamicLoadObject("UTTweaks.FireEffectCustom.FE2", class'Texture'));
            break;
    }
    if (T != none)
        Class'ShockProj'.default.Texture = T;
}

static function SetShockComboTweaks(string option) {
    switch (option) {
        case "Default":
            Class'UT_Comboring'.default.skin = Texture'Botpack.Effects.pPurpleRing';
            break;
        case "Light":
            Class'UT_Comboring'.default.skin = None;
            break;
        case "Fire":
            Class'UT_Comboring'.default.skin = Texture'UnrealShare.Effect50.FireEffect50';
            break;
        case "Thunder":
            Class'UT_Comboring'.default.skin = Texture'Botpack.TeamSymbols.TLThunder';
            break;
        case "Radial":
            Class'UT_Comboring'.default.skin = Texture'Botpack.Effects.I_TeamB';
            break;
    }
}

static function SetPulsePrimaryTweaks(string option) {
    local Texture T, TExp, TEffect;
    local float Scale;
    local byte Hue;

    switch (option) {
        case "Default":
            TEffect = Texture(DynamicLoadObject("Botpack.PlasmaExplo.pblst_a00", class'Texture'));
            T = TEffect;
            TExp = TEffect;
            Scale = 0.19;
            Hue = 83;
            break;
        case "Cyan":
            TEffect = Texture(DynamicLoadObject("Botpack.FlakGlow.fglow_a00", class'Texture'));
            T = Texture(DynamicLoadObject("UTTweaks.Blupblst_a00", class'Texture'));
            TExp = T;
            Scale = 0.19;
            Hue = 140;
            break;
        case "Static":
            TEffect = Texture(DynamicLoadObject("Botpack.FlakGlow.fglow_a00", class'Texture'));
            T = Texture(DynamicLoadObject("Botpack.FlareFX.utflare3", class'Texture'));
            TExp = Texture(DynamicLoadObject("Botpack.UT_Explosions.Exp4_a00", class'Texture'));
            Scale = 0.24;
            Hue = 120;
            break;
        default:
            return;
    }
    if (TEffect != none)
        Class'PlasmaEffect'.default.Texture = TEffect;
    if (T != none)
        Class'PlasmaSphere'.default.Texture = T;
    if (TExp != none)
        Class'PlasmaSphere'.default.exptype = TExp;
    Class'PlasmaSphere'.default.DrawScale = Scale;
    Class'PlasmaSphere'.default.Lighthue = Hue;
}

static function SetPulseBeamTweaks(string option) {
    local Texture TCap, THit;
    local Mesh M;
    local float CapScale, HitScale;

    TCap = Texture(DynamicLoadObject("Botpack.BoltHit.phit_a00", class'Texture'));
    THit = Texture(DynamicLoadObject("Botpack.BoltCap.pEnd_a00", class'Texture'));

    switch (option) {
        case "Default":
            M = Mesh(DynamicLoadObject("Botpack.PBolt", class'Mesh'));
            CapScale = 0.65;
            HitScale = 0.65;
            Class'StarterBolt'.default.DrawScale = 1;
            Class'PBolt'.default.DrawScale = 1;
            Class'PBolt'.default.bMeshEnviroMap = False;
            break;
        case "Reduced":
            M = Mesh(DynamicLoadObject("UTTweaks.PBolt_Medium", class'Mesh'));
            CapScale = 0.5;
            HitScale = 0.5;
            Class'PBolt'.default.DrawType = DT_Mesh;
            break;
        default:
            return;
    }
    if (M != none) {
        Class'StarterBolt'.default.Mesh = M;
        Class'PBolt'.default.Mesh = M;
    }
    if (TCap != none)
        Class'PlasmaCap'.default.Texture = TCap;
    Class'PlasmaCap'.default.DrawScale = CapScale;
    if (THit != none)
        Class'PlasmaHit'.default.Texture = THit;
    Class'PlasmaHit'.default.DrawScale = HitScale;
}

static function SetFlakCannonTweaks(string option) {
    switch (option) {
        case "Default":
            Class'ChunkTrail'.default.Texture = Texture'Botpack.FlakGlow.fglow_a00';
            break;
        case "Yellow":
            Class'ChunkTrail'.default.Texture = Texture'Botpack.Effects.Sparky';
            break;
        case "Cyan":
            Class'ChunkTrail'.default.Texture = Texture'Botpack.FlareFX.utflare4';
            break;
        case "Light Purple":
            Class'ChunkTrail'.default.Texture = Texture'Botpack.FlareFX.utflare2';
            break;
        case "Dark Purple":
            Class'ChunkTrail'.default.Texture = Texture'Botpack.Effects.jenergy2';
            break;
    }
}

static function SetRocketLauncherSmokeTweaks(bool enable) {
    if (enable) {
        Class'UT_SpriteSmokePuff'.default.DrawScale = 1;
        Class'UTSmokeTrail'.default.DrawScale = 2;
        Class'UTSmokeTrail'.default.ScaleGlow = 0.4;
        Class'UTSmokeTrail'.default.LifeSpan = 1.2;
        Class'UTSmokeTrail'.default.Mesh = LodMesh'Botpack.Smokebm';
        Class'UTSmokeTrail'.default.Curr = 3;
        Class'UTSmokeTrail'.default.DrawType = DT_SpriteAnimOnce;
        Class'UTSmokeTrail'.default.LightBrightness = 10;
        Class'UTSmokeTrail'.default.LightSaturation = byte(255);
        Class'UTSmokeTrail'.default.LightRadius = 7;
        Class'UTSmokeTrail'.default.bParticles = false;
        Class'UTSmokeTrail'.default.bRandomFrame = false;
        Class'LightSmokeTrail'.default.DrawScale = 2;
        Class'LightSmokeTrail'.default.ScaleGlow = 0.4;
        Class'LightSmokeTrail'.default.LifeSpan = 1.2;
        Class'LightSmokeTrail'.default.Mesh = LodMesh'Botpack.Smokebm';
        Class'LightSmokeTrail'.default.Curr = 3;
        Class'LightSmokeTrail'.default.DrawType = DT_SpriteAnimOnce;
        Class'LightSmokeTrail'.default.LightBrightness = 10;
        Class'LightSmokeTrail'.default.LightSaturation = byte(255);
        Class'LightSmokeTrail'.default.LightRadius = 7;
        Class'LightSmokeTrail'.default.bParticles = false;
        Class'LightSmokeTrail'.default.bRandomFrame = false;
    } else {
        Class'UT_SpriteSmokePuff'.default.DrawScale = 2;
        Class'UTSmokeTrail'.default.DrawScale = 2;
        Class'UTSmokeTrail'.default.ScaleGlow = 0.800000;
        Class'UTSmokeTrail'.default.LifeSpan = 1.60000;
        Class'UTSmokeTrail'.default.Mesh = LodMesh'Botpack.Smokebm';
        Class'UTSmokeTrail'.default.Curr = 7;
        Class'UTSmokeTrail'.default.DrawType = DT_Mesh;
        Class'UTSmokeTrail'.default.LightBrightness = 0;
        Class'UTSmokeTrail'.default.LightSaturation = 0;
        Class'UTSmokeTrail'.default.LightRadius = 0;
        Class'UTSmokeTrail'.default.bParticles = true;
        Class'UTSmokeTrail'.default.bRandomFrame = true;
        Class'LightSmokeTrail'.default.DrawScale = 2;
        Class'LightSmokeTrail'.default.ScaleGlow = 0.800000;
        Class'LightSmokeTrail'.default.LifeSpan = 1.60000;
        Class'LightSmokeTrail'.default.Mesh = LodMesh'Botpack.Smokebm';
        Class'LightSmokeTrail'.default.Curr = 7;
        Class'LightSmokeTrail'.default.DrawType = DT_Mesh;
        Class'LightSmokeTrail'.default.LightBrightness = 0;
        Class'LightSmokeTrail'.default.LightSaturation = 0;
        Class'LightSmokeTrail'.default.LightRadius = 0;
        Class'LightSmokeTrail'.default.bParticles = true;
        Class'LightSmokeTrail'.default.bRandomFrame = true;
    }
}

static function StopRocketRotationTweaks(bool enable) {
    if (enable) {
        Class'RocketMk2'.default.RotationRate.Roll = 0;
    } else {
        Class'RocketMk2'.default.RotationRate.Roll = 50000;
    }
}

static function SetShellCaseTweaks(bool enable) {
    if (enable) {
        Class'Minigun2'.default.MuzzleFlashScale = 0.04;
        Class'MiniShellCase'.default.DrawScale = 0;
        Class'MiniShellCase'.default.bHidden = true;
        Class'UT_ShellCase'.default.DrawScale = 0;
        Class'UT_ShellCase'.default.bHidden = true;
    } else {
        Class'Minigun2'.default.MuzzleFlashScale = 0.25;
        Class'MiniShellCase'.default.DrawScale = 1.2;
        Class'MiniShellCase'.default.bHidden = false;
        Class'UT_ShellCase'.default.DrawScale = 1;
        Class'UT_ShellCase'.default.bHidden = false;
    }
}

static function RemoveWeaponShake(bool enable) {
    if (enable) {
        Class'ut_eightball'.default.shaketime = 0;
        Class'ut_eightball'.default.shakemag = 0;
        Class'ut_flakcannon'.default.shaketime = 0;
        Class'sniperrifle'.default.shaketime = 0;
        Class'minigun2'.default.shaketime = 0;
        Class'minigun2'.default.shakemag = 0;
        Class'minigun2'.default.shakevert = 0;
        Class'pulsegun'.default.shaketime = 0;
        Class'pulsegun'.default.shakemag = 0;
        Class'pulsegun'.default.shakevert = 0;
        Class'enforcer'.default.shaketime = 0;
        Class'ripper'.default.shakevert = 0;
        Class'ripper'.default.shakemag = 0;
        Class'ut_biorifle'.default.shaketime = 0;
        Class'shockrifle'.default.shaketime = 0;
        Class'impacthammer'.default.shaketime = 0;
        Class'impacthammer'.default.shakemag = 0;
        Class'warheadlauncher'.default.shaketime = 0;
    } else {
        Class'ut_eightball'.default.shaketime = 0.200000;
        Class'ut_eightball'.default.shakemag = 350.000000;
        Class'ut_flakcannon'.default.shaketime = 0.150000;
        Class'sniperrifle'.default.shaketime = 0.150000;
        Class'minigun2'.default.shaketime = 0.100000;
        Class'minigun2'.default.shakemag = 135.000000;
        Class'minigun2'.default.shakevert = 8.000000;
        Class'pulsegun'.default.shaketime = 0.100000;
        Class'pulsegun'.default.shakemag = 135.000000;
        Class'pulsegun'.default.shakevert = 8.000000;
        Class'enforcer'.default.shaketime = 0.100000;
        Class'ripper'.default.shakevert = 5.000000;
        Class'ripper'.default.shakemag = 120.000000;
        Class'ut_biorifle'.default.shaketime = 0.100000;
        Class'shockrifle'.default.shaketime = 0.100000;
        Class'impacthammer'.default.shaketime = 0.100000;
        Class'impacthammer'.default.shakemag = 300.000000;
        Class'warheadlauncher'.default.shaketime = 0.200000;
    }
}


static function BrighterPickups(bool enable) {
    if (enable) {
        Class'medbox'.default.bunlit = True;
        Class'healthvial'.default.bunlit = True;
        Class'healthpack'.default.bunlit = True;
        Class'ut_shieldbelt'.default.bunlit = True;
        Class'udamage'.default.bunlit = True;
        Class'thighpads'.default.bunlit = True;
        Class'armor2'.default.bunlit = True;
        Class'ut_jumpboots'.default.bunlit = True;
        Class'shieldd'.default.bunlit = True;
        Class'eclip'.default.bunlit = True;
        Class'miniammo'.default.bunlit = True;
        Class'bioammo'.default.bunlit = True;
        Class'shockcore'.default.bunlit = True;
        Class'pammo'.default.bunlit = True;
        Class'bladehopper'.default.bunlit = True;
        Class'flakammo'.default.bunlit = True;
        Class'rocketpack'.default.bunlit = True;
        Class'bulletbox'.default.bunlit = True;
        Class'ut_eightball'.default.bunlit = True;
        Class'ut_flakcannon'.default.bunlit = True;
        Class'sniperrifle'.default.bunlit = True;
        Class'minigun2'.default.bunlit = True;
        Class'pulsegun'.default.bunlit = True;
        Class'enforcer'.default.bunlit = True;
        Class'ripper'.default.bunlit = True;
        Class'ut_biorifle'.default.bunlit = True;
        Class'shockrifle'.default.bunlit = True;
    } else {
        Class'medbox'.default.bunlit = False;
        Class'healthvial'.default.bunlit = False;
        Class'healthpack'.default.bunlit = False;
        Class'ut_shieldbelt'.default.bunlit = False;
        Class'udamage'.default.bunlit = False;
        Class'thighpads'.default.bunlit = False;
        Class'armor2'.default.bunlit = False;
        Class'ut_jumpboots'.default.bunlit = False;
        Class'shieldd'.default.bunlit = False;
        Class'eclip'.default.bunlit = False;
        Class'miniammo'.default.bunlit = False;
        Class'bioammo'.default.bunlit = False;
        Class'shockcore'.default.bunlit = False;
        Class'pammo'.default.bunlit = False;
        Class'bladehopper'.default.bunlit = False;
        Class'flakammo'.default.bunlit = False;
        Class'rocketpack'.default.bunlit = False;
        Class'bulletbox'.default.bunlit = False;
        Class'ut_eightball'.default.bunlit = False;
        Class'ut_flakcannon'.default.bunlit = False;
        Class'sniperrifle'.default.bunlit = False;
        Class'minigun2'.default.bunlit = False;
        Class'pulsegun'.default.bunlit = False;
        Class'enforcer'.default.bunlit = False;
        Class'ripper'.default.bunlit = False;
        Class'ut_biorifle'.default.bunlit = False;
        Class'shockrifle'.default.bunlit = False;
    }
}

static function SimplePickupMessages(bool enable) {
    if (enable) {
        Class'pickupmessageplus'.default.bisconsolemessage = False;
        Class'pickupmessagehealthplus'.default.bisconsolemessage = False;
        Class'healthvial'.default.pickupmessage = "+ HP ";
        Class'healthpack'.default.pickupmessage = "+ Keg";
        Class'medbox'.default.pickupmessage = "+ HP ";
        Class'ut_shieldbelt'.default.pickupmessage = "+ Belt";
        Class'udamage'.default.pickupmessage = "+ Amp";
        Class'thighpads'.default.pickupmessage = "+ Pads";
        Class'armor2'.default.pickupmessage = "+ Armor";
        Class'ut_jumpboots'.default.pickupmessage = "+ Boots";
        Class'UT_Invisibility'.default.pickupmessage = "+ Invi";
        Class'miniammo'.default.pickupmessage = "+ Mini Ammo";
        Class'bioammo'.default.pickupmessage = "+ Bio Ammo";
        Class'shockcore'.default.pickupmessage = "+ Shock Ammo";
        Class'pammo'.default.pickupmessage = "+ Pulse Ammo";
        Class'bladehopper'.default.pickupmessage = "+ Ripper Ammo";
        Class'flakammo'.default.pickupmessage = "+ Flak Ammo";
        Class'rocketpack'.default.pickupmessage = "+ Rocket Ammo";
        Class'bulletbox'.default.pickupmessage = "+ Sniper Ammo";
        Class'ut_eightball'.default.pickupmessage = "+ Rockets";
        Class'ut_flakcannon'.default.pickupmessage = "+ Flak";
        Class'sniperrifle'.default.pickupmessage = "+ Sniper";
        Class'minigun2'.default.pickupmessage = "+ Mini";
        Class'pulsegun'.default.pickupmessage = "+ Pulse";
        Class'enforcer'.default.pickupmessage = "+ Enforcer";
        Class'ripper'.default.pickupmessage = "+ Ripper";
        Class'ut_biorifle'.default.pickupmessage = "+ Bio";
        Class'shockrifle'.default.pickupmessage = "+ Shock";
        Class'warheadlauncher'.default.pickupmessage = "+ Redeemer";
    } else {
        Class'pickupmessageplus'.default.bisconsolemessage = True;
        Class'pickupmessagehealthplus'.default.bisconsolemessage = True;
        Class'healthvial'.default.pickupmessage = "You picked up a Health Vial +";
        Class'healthpack'.default.pickupmessage = "You picked up the Big Keg O' Health +";
        Class'medbox'.default.pickupmessage = "You picked up a Health Pack +";
        Class'ut_shieldbelt'.default.pickupmessage = "You got the Shield Belt.";
        Class'udamage'.default.pickupmessage = "You got the Damage Amplifier!";
        Class'thighpads'.default.pickupmessage = "You got the Thigh Pads.";
        Class'armor2'.default.pickupmessage = "You got the Body Armor.";
        Class'ut_jumpboots'.default.pickupmessage = "You picked up the jump boots";
        Class'UT_Invisibility'.default.pickupmessage = "You have Invisibility.";
        Class'miniammo'.default.pickupmessage = "You picked up 50 bullets.";
        Class'bioammo'.default.pickupmessage = "You picked up the Biosludge Ammo.o";
        Class'shockcore'.default.pickupmessage = "You picked up a Shock Core.";
        Class'pammo'.default.pickupmessage = "You picked up a Pulse Cell.";
        Class'bladehopper'.default.pickupmessage = "You picked up some Razor Blades.";
        Class'flakammo'.default.pickupmessage = "You picked up 10 Flak Shells.";
        Class'rocketpack'.default.pickupmessage = "You picked up a rocket pack.";
        Class'bulletbox'.default.pickupmessage = "You got a box of rifle rounds.";
        Class'ut_eightball'.default.pickupmessage = "You got the Rocket Launcher.";
        Class'ut_flakcannon'.default.pickupmessage = "You got the Flak Cannon.";
        Class'sniperrifle'.default.pickupmessage = "You got a Sniper Rifle.";
        Class'minigun2'.default.pickupmessage = "You got the Minigun.";
        Class'pulsegun'.default.pickupmessage = "You got a Pulse Gun.";
        Class'enforcer'.default.pickupmessage = "You picked up another Enforcer!";
        Class'ripper'.default.pickupmessage = "You got the Ripper.";
        Class'ut_biorifle'.default.pickupmessage = "You got the GES BioRifle.";
        Class'shockrifle'.default.pickupmessage = "You got the ASMD Shock Rifle.";
        Class'warheadlauncher'.default.pickupmessage = "You got the Redeemer.";
    }
}

static function SimpleFragMessages(bool enable) {
    if (enable) {
        Class'ut_eightball'.default.deathmessage = "%k  >> [Rocket] >>  %o";
        Class'ut_flakcannon'.default.deathmessage = "%k  >> [Flak] >>  %o";
        Class'sniperrifle'.default.deathmessage = "%k  >> [Sniper] >>  %o";
        Class'minigun2'.default.deathmessage = "%k  >> [Mini] >>  %o";
        Class'pulsegun'.default.deathmessage = "%k  >> [Pulse] >>  %o";
        Class'enforcer'.default.deathmessage = "%k  >> [Enforcer] >>  %o";
        Class'ripper'.default.deathmessage = "%k  >> [Ripper] >>  %o";
        Class'ut_biorifle'.default.deathmessage = "%k  >> [Bio] >>  %o";
        Class'shockrifle'.default.deathmessage = "%k  >> [Shock] >>  %o";
        Class'impacthammer'.default.deathmessage = "%k  >> [Hammer] >>  %o";
        Class'translocator'.default.deathmessage = "%k  >> [Tele] >>  %o";
        Class'warheadlauncher'.default.deathmessage = "%k  >> [Nuke] >>  %o";
        Class'supershockrifle'.default.deathmessage = "%k  >> [Insta] >>  %o";
    } else {
        Class'ut_eightball'.default.deathmessage = "%o was smacked down by %k's %w.";
        Class'ut_flakcannon'.default.deathmessage = "%o was ripped to shreds by %k's %w.";
        Class'sniperrifle'.default.deathmessage = "%k put a bullet through %o's head.";
        Class'minigun2'.default.deathmessage = "%k's %w turned %o into a leaky piece of meat.";
        Class'pulsegun'.default.deathmessage = "%o ate %k's burning plasma death.";
        Class'enforcer'.default.deathmessage = "%k riddled %o full of holes with the %w.";
        Class'ripper'.default.deathmessage = "%k ripped a chunk of meat out of %o with the %w.";
        Class'ut_biorifle'.default.deathmessage = "%o drank a glass of %k's dripping green load.";
        Class'shockrifle'.default.deathmessage = "%k inflicted mortal damage upon %o with the %w.";
        Class'impacthammer'.default.deathmessage = "%o got smeared by %k's piston.";
        Class'translocator'.default.deathmessage = "%k telefragged %o!";
        Class'warheadlauncher'.default.deathmessage = "%o was vaporized by %k's %w!!";
        Class'supershockrifle'.default.deathmessage = "%k electrified %o with the %w.";
    }
}

// ============================================================================
// Static functions to apply tweaks to individual actors
// ============================================================================

static function ApplyPickupTweaks(Pickup P, UTTweaks_Settings S) {
    local string Msg;

    if (S.BrighterPickups)
        P.bUnlit = true;

    if (S.SimplePickupMessages) {
        Msg = GetSimplePickupMessage(P);
        P.Class.default.PickupMessage = Msg;
        P.Class.default.PickupMessageClass = None;
        P.PickupMessage = Msg;
        P.PickupMessageClass = None;
    }
}

static function ApplyWeaponTweaks(TournamentWeapon W, UTTweaks_Settings S) {
    local string Msg;

    if (S.BrighterPickups)
        W.bUnlit = true;

    if (S.SimplePickupMessages) {
        Msg = GetSimpleWeaponPickupMessage(W);
        W.Class.default.PickupMessage = Msg;
        W.Class.default.PickupMessageClass = None;
        W.PickupMessage = Msg;
        W.PickupMessageClass = None;
    }

    if (S.SimpleFragMessages) {
        Msg = GetSimpleDeathMessage(W);
        W.Class.default.DeathMessage = Msg;
        W.DeathMessage = Msg;
    }
}

// ============================================================================
// Static helper functions for message lookups
// ============================================================================

static function string GetSimplePickupMessage(Pickup P) {
    if (P.IsA('HealthVial')) return "+ HP ";
    if (P.IsA('HealthPack')) return "+ Keg";
    if (P.IsA('MedBox')) return "+ HP ";
    if (P.IsA('UT_ShieldBelt')) return "+ Belt";
    if (P.IsA('UDamage')) return "+ Amp";
    if (P.IsA('ThighPads')) return "+ Pads";
    if (P.IsA('Armor2')) return "+ Armor";
    if (P.IsA('UT_JumpBoots')) return "+ Boots";
    if (P.IsA('UT_Invisibility')) return "+ Invi";
    if (P.IsA('Miniammo')) return "+ Mini Ammo";
    if (P.IsA('BioAmmo')) return "+ Bio Ammo";
    if (P.IsA('ShockCore')) return "+ Shock Ammo";
    if (P.IsA('PAmmo')) return "+ Pulse Ammo";
    if (P.IsA('BladeHopper')) return "+ Ripper Ammo";
    if (P.IsA('FlakAmmo')) return "+ Flak Ammo";
    if (P.IsA('RocketPack')) return "+ Rocket Ammo";
    if (P.IsA('BulletBox')) return "+ Sniper Ammo";
    if (P.IsA('UT_Eightball')) return "+ Rockets";
    if (P.IsA('UT_FlakCannon')) return "+ Flak";
    if (P.IsA('SniperRifle')) return "+ Sniper";
    if (P.IsA('Minigun2')) return "+ Mini";
    if (P.IsA('PulseGun')) return "+ Pulse";
    if (P.IsA('Enforcer')) return "+ Enforcer";
    if (P.IsA('Ripper')) return "+ Ripper";
    if (P.IsA('UT_BioRifle')) return "+ Bio";
    if (P.IsA('ShockRifle')) return "+ Shock";
    if (P.IsA('WarheadLauncher')) return "+ Redeemer";
    return P.PickupMessage;
}

static function string GetSimpleWeaponPickupMessage(TournamentWeapon W) {
    if (W.IsA('UT_Eightball')) return "+ Rockets";
    if (W.IsA('UT_FlakCannon')) return "+ Flak";
    if (W.IsA('SniperRifle')) return "+ Sniper";
    if (W.IsA('Minigun2')) return "+ Mini";
    if (W.IsA('PulseGun')) return "+ Pulse";
    if (W.IsA('Enforcer')) return "+ Enforcer";
    if (W.IsA('Ripper')) return "+ Ripper";
    if (W.IsA('UT_BioRifle')) return "+ Bio";
    if (W.IsA('SuperShockRifle')) return "+ Insta";
    if (W.IsA('ShockRifle')) return "+ Shock";
    if (W.IsA('ImpactHammer')) return "+ Hammer";
    if (W.IsA('Translocator')) return "+ Tele";
    if (W.IsA('WarheadLauncher')) return "+ Redeemer";
    return W.PickupMessage;
}

static function string GetSimpleDeathMessage(TournamentWeapon W) {
    if (W.IsA('UT_Eightball')) return "%k  >> [Rocket] >>  %o";
    if (W.IsA('UT_FlakCannon')) return "%k  >> [Flak] >>  %o";
    if (W.IsA('SniperRifle')) return "%k  >> [Sniper] >>  %o";
    if (W.IsA('Minigun2')) return "%k  >> [Mini] >>  %o";
    if (W.IsA('PulseGun')) return "%k  >> [Pulse] >>  %o";
    if (W.IsA('Enforcer')) return "%k  >> [Enforcer] >>  %o";
    if (W.IsA('Ripper')) return "%k  >> [Ripper] >>  %o";
    if (W.IsA('UT_BioRifle')) return "%k  >> [Bio] >>  %o";
    if (W.IsA('SuperShockRifle')) return "%k  >> [Insta] >>  %o";
    if (W.IsA('ShockRifle')) return "%k  >> [Shock] >>  %o";
    if (W.IsA('ImpactHammer')) return "%k  >> [Hammer] >>  %o";
    if (W.IsA('Translocator')) return "%k  >> [Tele] >>  %o";
    if (W.IsA('WarheadLauncher')) return "%k  >> [Nuke] >>  %o";
    return W.DeathMessage;
}

defaultproperties
{
}
