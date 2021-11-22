# GameJam todo

## Energy Streamer
    
    - [ ] Create energy nodes
        - [x] Common property energy
        - [ ] Custom behaviour, fire size, boiling stream etc.
        - [ ] Create animations
        - [ ] Visualize current energy level on scale
        - [ ] Nodes
            - [x] Cauldron
            - [x] Fire
            - [x] Rising platform
            - [x] Horizontally bouncing/moving platform/springing
            - [ ] Lamp
            - [ ] Negative energy/direct energy out from water to freeze it
            - [ ] Vibrating bouncy platform
    - [x] Create connection handler
        - [x] Detect energy nodes based on collision layer and energy property
        - [x] Handle unhandled inputs in all scenes
        - [x] Handle connection graphics (line/spline)
        - [x] Drive the energy transfer in the process function
    - [x] Implement or import character controller
    - [ ] Implement tilemap for levels https://kenney.nl/assets/abstract-platformer
    - [ ] Design good levels
    - [ ] Sound design
    - [ ] Implement Level selector, menu and level end target
    - [ ] Add hurt zones where the player can die on the level
    - [ ] Maybe fire hurts the player?
    - [ ] Get overlapping areas for connection: if multiple use the closest

## Level ideas
    - Vertically narrow corridor, many horizontal oscillators, have to set one by one
    - Cauldron lift up/ basic platform lift up
    - Need to find place to dump energy instead of sourcing it
    - Oscillating platform opens up horizontal passage / drop down
    - Source can only be one that the player is touching?
    - Moving platform combined with uplift, cancelling each other

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
    
    The inspiration character is a lute player, if we could sneak a little bit of lute sound in somewhere that would be a cool small addition

## Other/Optional

    - [ ] Automate itch uploads
    - [ ] Mobile controls, animation tests etc