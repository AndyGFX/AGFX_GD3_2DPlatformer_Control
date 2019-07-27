# GD3 2D Platformer Control & more


![Alt text](Screenshots/Godot_v3.0.6-stable_win64_2018-10-16_19-48-05.png?raw=true "PREVIEW")

# FEATURES :

- class for input event
    - IsPressed
    - IsHold
    - IsReleased
- class for shooting
    - with rapid fire option on/off
- class for throwing
- class for Platformer2D movement
    - move left
    - move right
    - jump/double jump
    - fall
    - pickup    
    - crunch
- class for animation state checker by assigned Platformer2D movement instance
- collision check is included inside classes
- play animation
- player facing by movement direction
- save/load player gamedata to JSON
- player start position and respawn
- pickup coins
- pickup ammo
- pickup health
- pickup grenade
- pickup chest keys [A,B,C,D]
- basic entities:
  - hazard (left, right, up, down) with hurt direction for player
  - enemies
    - walking horizontaly
    - walking verticaly
    - flying (not implemented yet)
  - powerups/modifiers with defined duration
    - player movement speed
    - player jump height
    - world gravity
  - InfoPanel (show message box with user defined text)
  - Doors
    - with move player to target position (next door with spawn position)
    - controled by USE key
    - open door only with specific key
  - Chest
    - opened by F button
    - open with chest key owned
- simple inventory system
- build level from TMX file created and defined in Tiled only

# TODO

- create basic entities:  
  - minimap (?)
