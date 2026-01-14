class UTTweaks_ClientRep extends Info;

var PlayerPawn PlayerOwner;
var UTTweaks_Dialog SettingsMenu;
var UTTweaks_Settings Settings;
var UTTweaks_SpawnNotify SpawnNotify;
var bool bInitialized;

replication
{
    reliable if (Role == ROLE_Authority)
        ClientOpenMenu;
}

function PostBeginPlay() {
    Super.PostBeginPlay();
    PlayerOwner = PlayerPawn(Owner);
    SetOwner(PlayerOwner);
}

simulated function PostNetBeginPlay() {
    Super.PostNetBeginPlay();
    if (Level.NetMode != NM_DedicatedServer)
        ClientInitialize();
}

simulated function ClientInitialize() {
    if (Settings == none) {
        Settings = class'UTTweaks_Settings'.static.LoadSettings();
        Log("UTTweaks: Loaded client settings", 'UTTweaks');
    }

    if (SpawnNotify == none && Settings.bEnabled) {
        SpawnNotify = Spawn(class'UTTweaks_SpawnNotify');
        if (SpawnNotify != none)
            SpawnNotify.Settings = Settings;
    }

    class'UTTweaks'.static.ApplyAllTweaksFromSettings(Settings);
    bInitialized = true;
    Enable('Tick');
}

simulated function Tick(float DeltaTime) {
    if (!bInitialized || Settings == none)
        return;

    // Set PlayerOwner on client (PostBeginPlay only runs on server)
    if (PlayerOwner == none)
        PlayerOwner = PlayerPawn(Owner);

    // Wait until player is ready
    if (PlayerOwner == none || PlayerOwner.Player == none)
        return;

    // Apply tweaks to existing actors
    if (Settings.bEnabled)
        ApplyToAllActors();

    // Setup complete - disable Tick to save CPU
    Disable('Tick');
}

// One-time sweep for all pickups and weapons
simulated function ApplyToAllActors() {
    local Pickup P;
    local TournamentWeapon W;

    foreach AllActors(class'Pickup', P) {
        class'UTTweaks'.static.ApplyPickupTweaks(P, Settings);
    }

    foreach AllActors(class'TournamentWeapon', W) {
        class'UTTweaks'.static.ApplyWeaponTweaks(W, Settings);
    }
}

simulated function ClientOpenMenu() {
    local WindowConsole C;

    if (Level.NetMode == NM_DedicatedServer)
        return;

    if (PlayerOwner == none)
        PlayerOwner = PlayerPawn(Owner);

    if (PlayerOwner == none || PlayerOwner.Player == none)
        return;

    if (Settings == none)
        ClientInitialize();

    C = WindowConsole(PlayerOwner.Player.Console);
    if (C == none) {
        PlayerOwner.ClientMessage("UTTweaks: Console not available");
        return;
    }

    if (!C.bShowConsole && !C.IsInState('UWindow')) {
        C.bQuickKeyEnable = True;
        C.LaunchUWindow();
    }

    if (SettingsMenu == none && C.Root != none) {
        SettingsMenu = UTTweaks_Dialog(C.Root.CreateWindow(
            class'UTTweaks_Dialog',
            Settings.MenuX, Settings.MenuY,
            Settings.MenuWidth, Settings.MenuHeight
        ));
    }

    if (SettingsMenu != none) {
        SettingsMenu.bLeaveOnscreen = true;
        SettingsMenu.ShowWindow();
    }
}

defaultproperties
{
    bAlwaysRelevant=False
    bNetTemporary=False
    RemoteRole=ROLE_SimulatedProxy
    bHidden=True
}
