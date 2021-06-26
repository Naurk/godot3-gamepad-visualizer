# Godot3 Gamepad Visualizer

Just a simple gamepad/joypad visualizer fot Godot Engine 3.x.
Basic inputs are associated to a joypad ID and showed on the respective gamepad representation.

## Using

Like the main scene ("Test-Scene" in the project), just instance the gamepad scene ("gamepad-input-visualizer\input-visualizer") and associate it with an ID.
You can change the ID in the Script Variables: 0 is the main controller connected.
Device ID are treated as
```gdscript
export (int) var current_device
```
Interpolation Stick is the value used to interpolate the movements of the sticks from their respective origin. Higher the value higher the constraint.

## TODO

-Different methods for spawn, connect and disconnect devices in real time.
-Improve design and give some possibilities of design customization.
-Optimize for standalone use. 
