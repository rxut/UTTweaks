class UTTweaks_SpawnNotify extends SpawnNotify;

var UTTweaks_Settings Settings;

simulated event Actor SpawnNotification(Actor A) {
    if (Settings == none || !Settings.bEnabled)
        return A;

    if (A.IsA('BioGlob') || A.IsA('BioSplash') || A.IsA('UT_BioGel'))
        ApplyBioTweaks(A);
    else if (A.IsA('ShockProj'))
        ApplyShockProjTweaks(A);
    else if (A.IsA('PlasmaSphere'))
        ApplyPlasmaTweaks(A);
    else if (A.IsA('StarterBolt') || A.IsA('PBolt'))
        ApplyPulseBoltTweaks(A);
    else if (A.IsA('PlasmaCap') || A.IsA('PlasmaHit'))
        ApplyPulseEffectTweaks(A);
    else if (A.IsA('Pickup'))
        ApplyPickupTweaks(Pickup(A));
    else if (A.IsA('TournamentWeapon'))
        ApplyWeaponTweaks(TournamentWeapon(A));

    return A;
}

simulated function ApplyBioTweaks(Actor A) {
    local Texture T;

    switch (Settings.BioRifleTweaks) {
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
        default:
            return;
    }
    if (T != none)
        A.Texture = T;
}

simulated function ApplyShockProjTweaks(Actor A) {
    local Texture T;

    switch (Settings.ShockProjectileTweaks) {
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
        default:
            return;
    }
    if (T != none)
        A.Texture = T;
}

simulated function ApplyPlasmaTweaks(Actor A) {
    local Texture T;
    local PlasmaSphere PS;

    PS = PlasmaSphere(A);
    if (PS == none)
        return;

    switch (Settings.PulsePrimaryTweaks) {
        case "Cyan":
            T = Texture(DynamicLoadObject("UTTweaks.Blupblst_a00", class'Texture'));
            PS.LightHue = 140;
            break;
        case "Static":
            T = Texture(DynamicLoadObject("Botpack.FlareFX.utflare3", class'Texture'));
            PS.LightHue = 120;
            PS.DrawScale = 0.24;
            break;
        default:
            return;
    }
    if (T != none)
        PS.Texture = T;
}

simulated function ApplyPulseBoltTweaks(Actor A) {
    if (Settings.PulseBeamTweaks == "Reduced")
        A.Mesh = Mesh(DynamicLoadObject("UTTweaks.PBolt_Medium", class'Mesh'));
}

simulated function ApplyPulseEffectTweaks(Actor A) {
    if (Settings.PulseBeamTweaks == "Reduced")
        A.DrawScale = 0.5;
}

simulated function ApplyPickupTweaks(Pickup P) {
    class'UTTweaks'.static.ApplyPickupTweaks(P, Settings);
}

simulated function ApplyWeaponTweaks(TournamentWeapon W) {
    class'UTTweaks'.static.ApplyWeaponTweaks(W, Settings);
}

defaultproperties
{
    ActorClass=class'Engine.Actor'
    RemoteRole=ROLE_None
}
