#  Modern Manhunt (Datapack)

A **Minecraft Java datapack** that recreates the classic *Manhunt* game mode, modernized to use the **locator bar** instead of a compass and an easier start of the game.


##  Supported Versions

* **Minecraft Java 1.21 → 1.21.11** (Tested on 1.21.11, should be compatible with other supported versions)
* Fully vanilla & server-friendly **(Note that this pack will affect all players on a server, even ones without a team, to some extent)**


##  What This Datapack Does

* Adds a simple Manhunt setup with **Hunters vs Runner**
* Uses **Locator Bar** instead of a tracking compass
* Includes:

  * 30-second PvP grace period with countdown
  * Automatic PvP toggle
  * Win & loss detection
  * Clean stop/reset command


##  Core Gameplay Rules

### Teams

* **Hunters**

  * Blue names
  * Cannot transmit waypoints (runner cannot track hunters)
  
* **Runner**

  * Red name
  * Objective: survive and kill the Ender Dragon

### Win Conditions

*  Runner dies somehow → **Hunters win**
*  Ender Dragon dies → **Runner wins**


##  Commands

### Join Teams

```mcfunction
/team join Hunters <player>
/team join Runner <player>
```
(If no player is specified, player who executed team command will be assigned)

### Start the Game

```mcfunction
/function manhunt:start
```

This will:

* Disable PvP
* Freeze all players **(This distorts FOV. Disable "FOV Effects" in Accessibility to fix this. This has been implemented to stop anyone from running away with PVP disabled)**
* Clear all inventories
* Remove dropped items
* Fill Health & Saturation for everyone completely
* Disable waypoint transmission for Hunters
* Start a **30-second countdown**
* Enable PvP after the countdown
* Sets Worldspawn & Spawnpoint of everyone at coordinates of the player who executed the command.

### Stop the Game

```mcfunction
/function manhunt:stop
```

This will:

* Cancel the manhunt
* Remove bossbars & timers
* Restore altered attributes
* Show a gray **“Manhunt Stopped”** title


##  Installation

1. Download the datapack
2. Place it in:

   ```
   .minecraft/saves/<world>/datapacks/
   ```
3. Reload the world or run:

   ```
   /reload
   ```
4. Verify it loaded:

   ```
   /datapack list
   ```

That’s it. If it doesn’t work after this, its a bug we need to fix. Please report these on our github repository. (Linked Above)


##  How Waypoints Are Used

This datapack uses Minecraft’s **locator bar** introduced in 1.21.6.

### Attribute Used

* `minecraft:waypoint_transmit_range`

### What It Does

* Hunters have their transmit range set to `0.0`
* This prevents them from broadcasting their position to the runner
* The Runner remains unaffected

### Exact Command Syntax

```mcfunction
/attribute @a[team=Hunters] minecraft:waypoint_transmit_range base set 0.0
```

When the game stops, this attribute is restored to its default value.


---

Note: This datapack is NOT a fork of Lprogrammer's Manhunt datapack, but it was inspired by it. It was fully coded by us, and no code was reused from Lprogrammer's pack.
If you want to check their pack out, click [here](https://modrinth.com/datapack/manhunt_pack)
