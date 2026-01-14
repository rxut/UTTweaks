# UT Tweaks v3.0

A server-side mod for **Unreal Tournament (UT99)** that allows players to customize visual effects, weapon behaviors, and HUD messages through client-side settings.

## Features

### Weapon Visual Tweaks
| Weapon | Options |
|--------|---------|
| **Bio Rifle** | Default, Blue, Cyan, Red, Yellow |
| **Shock Beam** | Default, Light Blue, Cyan, Red, Green, Orange |
| **Shock Projectile** | Default, Static, Static Cyan, Red, Green, Unreal |
| **Shock Combo** | Default, Light, Fire, Thunder, Radial |
| **Pulse Primary** | Default, Cyan, Static |
| **Pulse Beam** | Default, Reduced |
| **Flak Cannon** | Default, Yellow, Cyan, Light Purple, Dark Purple |

### Gameplay Tweaks
- **Reduce Rocket Smoke** — Less visual clutter from rocket trails
- **Stop Rocket Rotation** — Rockets fly straight without spinning
- **Hide Shell Casings** — Removes minigun shell case effects
- **Remove Weapon Shake** — Eliminates screen shake when firing

### Visual Enhancements
- **Brighter Item/Weapon Pickups** — Makes pickups easier to see (bUnlit)
- **Simple Pickup Messages** — Shortened pickup notifications (e.g., "+ Belt" instead of "You got the Shield Belt.")
- **Simple Frag Messages** — Clean kill feed (e.g., "Player1 >> [Rocket] >> Player2")

## Installation

### Server Setup

1. Copy `UTTweaks.u` to your server's `System` folder:
   ```
   UnrealTournament/System/UTTweaks.u
   ```

2. Add the mutator to your server's startup command or `UnrealTournament.ini`:
   ```ini
   [Engine.GameEngine]
   ServerPackages=UTTweaks
   ```

3. Add the mutator to your game mode:
   ```
   ?mutator=UTTweaks.UTTweaksMutator
   ```

   Or in `UnrealTournament.ini` under your game type:
   ```ini
   Mutator=UTTweaks.UTTweaksMutator
   ```
I recommend using [VoteSys](https://github.com/Deaod/VoteSys/) for managing mutators.


### Client Requirements

No client-side installation needed! The mod automatically:
- Downloads to connecting players (if server has downloads enabled)
- Creates a `UTTweaks.ini` config file in the player's `System` folder
- Persists settings between sessions

## Usage

### Opening the Settings Menu

Type one of these commands in chat:
```
!tweaks
!uttweaks
```

The settings window will appear, allowing you to customize all available tweaks.

### Saving Settings

1. Adjust your preferred settings using the checkboxes and dropdowns
2. Click the **Save** button to apply changes
3. Most settings apply immediately; some visual tweaks apply on reconnect

### Toggle All Tweaks

Use the **"Toggle On/Off All Tweaks"** button to quickly enable or disable all customizations at once.

## Configuration

Settings are stored in `UTTweaks.ini` in your UT99 `System` folder:

```ini
[UTTweaks.Settings]
bEnabled=True
BioRifleTweaks=Cyan
ShockBeamTweaks=Default
ShockProjectileTweaks=Static
; ... etc
```

### Window Position

The mod remembers your settings window position:
```ini
MenuX=426.000000
MenuY=200.000000
MenuWidth=260.000000
MenuHeight=400.000000
```

## Compatibility

- **UT99 Version:** 469e recommended (compatible with 436+) — [OldUnreal Patches](https://github.com/OldUnreal/UnrealTournamentPatches)
- **InstaGibPlus:** Fully compatible — works alongside [IG+](https://github.com/Deaod/InstaGibPlus)
- **Other Mutators:** Should work with most server-side mutators

## Building from Source

Requires a UT99 Installation. Place the `UTTweaks` folder in your UT99 directory, navigate to that folder in your Terminal and compile with the provided build script:
```
./build.bat noint nouz silent
```

## Credits

- **Deaod** — For helping me with UnrealScript and working on IG+
- **OldUnreal Team** — For continuing to support the game with new patches
- **UT99 Community** — For patience, support, testing, and bug reports

This mod is released for the Unreal Tournament community. Feel free to use, modify, and distribute.

Note: UTTweaks was previously available as a client-side-only mod. You can find that legacy version [here](https://github.com/rxut/UT-Tweaks-Client-Side)


