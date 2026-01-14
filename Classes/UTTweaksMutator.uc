class UTTweaksMutator extends Mutator;

function PostBeginPlay() {
    Super.PostBeginPlay();
    Level.Game.RegisterMessageMutator(Self);
}

function ModifyPlayer(Pawn Other) {
    local UTTweaks_ClientRep Rep;

    Super.ModifyPlayer(Other);

    if (PlayerPawn(Other) != none && NetConnection(PlayerPawn(Other).Player) != none) {
        foreach Other.ChildActors(class'UTTweaks_ClientRep', Rep)
            if (Rep != none) return;

        Rep = Spawn(class'UTTweaks_ClientRep', Other);
    }
}

function bool MutatorTeamMessage(Actor Sender, Pawn Receiver, PlayerReplicationInfo PRI, 
    coerce string S, name Type, optional bool bBeep) 
{
    if (Sender == Receiver && (S ~= "!tweaks" || S ~= "!uttweaks")) {
        NotifyClientOpenMenu(PlayerPawn(Sender));
    }
    return Super.MutatorTeamMessage(Sender, Receiver, PRI, S, Type, bBeep);
}

function bool MutatorBroadcastMessage(Actor Sender, Pawn Receiver, 
    coerce string Msg, optional bool bBeep, out optional name Type)
{
    if (Sender == Receiver && (Msg ~= "!tweaks" || Msg ~= "!uttweaks")) {
        NotifyClientOpenMenu(PlayerPawn(Sender));
    }
    return Super.MutatorBroadcastMessage(Sender, Receiver, Msg, bBeep, Type);
}

function NotifyClientOpenMenu(PlayerPawn P) {
    local UTTweaks_ClientRep Rep;

    if (P == none) return;

    foreach P.ChildActors(class'UTTweaks_ClientRep', Rep) {
        if (Rep != none) {
            Rep.ClientOpenMenu();
            return;
        }
    }

    Rep = Spawn(class'UTTweaks_ClientRep', P);
    if (Rep != none)
        Rep.ClientOpenMenu();
}

defaultproperties
{
    bAlwaysRelevant=False
}
