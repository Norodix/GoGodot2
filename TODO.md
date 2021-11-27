# GameJam todo

## Energy Streamer
    
- [ ] Create energy nodes
    - [x] Common property energy
    - [x] Custom behaviour, fire size, boiling stream etc.
    - [ ] Create animations
        - [x] Cauldron boiling
        - [x] Cauldron steaming
        - [x] Lava popping
        - [ ] Fire smoking
    - [x] Visualize current energy level on scale
    - [x] Nodes
        - [x] Cauldron
        - [x] Fire
        - [x] Rising platform
        - [x] Horizontally bouncing/moving platform/springing
        - [x] Lava
        - [ ] ~~Lamp~~
        - [ ] ~~Negative energy/direct energy out from water to freeze it~~
        - [ ] ~~Vibrating bouncy platform~~
- [x] Create connection handler
    - [x] Detect energy nodes based on collision layer and energy property
    - [x] Handle unhandled inputs in all scenes
    - [x] Handle connection graphics (line/spline)
    - [x] Drive the energy transfer in the process function
- [x] Implement or import character controller
- [x] Implement tilemap for levels https://kenney.nl/assets/abstract-platformer
- [ ] Design good levels
- [ ] Sound design
- [ ] Implement Level selector, menu and level end target, pause
    - [ ] Main menu
        - [ ] Volume control
        - [ ] Credits
    - [x] Pause menu
        - [x] resume
        - [x] Exit
        - [x] restart
        - [x] level select
    - [x] Level target
    - Game node as static never changing root -> script adds/frees scenes to active level canvas layer on signal "level END"
        - World background
        - Pause menu -> https://www.youtube.com/watch?v=Jf7F3JhY9Fg
            - Resume
            - Restart
            - Select level
            - Exit
        - Active level / menu scene -> This managed by the game node script
    End of level flag/sth sends signal to Game node
    Active level is stored (with index) and handled by the game node (with set level and get level functions)
    Gamenode has clearLevels function to make sure there is no two levels active at the same time
- [x] Add hurt zones where the player can die on the level
- [x] Maybe fire hurts the player?
- [x] Get overlapping areas for connection: if multiple use the closest
- [x] Player cannot move while streaming energy
- [x] Automatically stop streaming energy when done
- [x] Spikes
- [ ] Create tutorial texts on the background

## Level ideas
- [x] Vertically narrow corridor, many horizontal oscillators, have to set one by one
- [x] Cauldron lift up/ basic platform lift up
- [ ] Need to find place to dump energy instead of sourcing it
- [ ] Oscillating platform opens up horizontal passage / drop down
- [x] ~~Source can only be one that the player is touching?~~
- [ ] Moving platform combined with uplift, cancelling each other
- [x] Jumping on the limit, have to preserve upwart momentum with draft
- [ ] Stuck in a "well" can get in, cant get out
- [x] Raise platform just enough so you can jump and reach the top as well
- [x] Platform would move too high into danger, must stop manually
- [ ] Combine cauldron uplift with moving platform
- [ ] Array of cauldrons and float through it

## Sound design
- Background music
- Energy nodes' sfx
    - Fire crackling
    - Water boiling bubbling
    - Platform moving, have to sync with platform material
- Character sfx
    - Running
    - Jumping
    - Landing
    - Magic energy transfer effect, (maybe something sparkly, have to sync with visual effect)
    - Success sound on flag pickup
    - Level fail sound

The inspiration character is a lute player, if we could sneak a little bit of lute sound in somewhere that would be a cool small addition

## Animations and Assets
- [ ] Character
    - [x] Idle
    - [ ] Walking
    - [ ] Jumping -> leaves "exploding"
    - [ ] Falling
    - [ ] Magic / casting
- [ ] Fire
- [ ] Lava and stone
- [x] Cauldron bubbles (optional)
- [ ] Background



## Other/Optional

- [ ] Automate itch uploads
- [ ] Mobile controls, animation tests etc