# Godot3 Gamepad Visualizer
![joypad image](/gamepad-input-visualizer/images/joypad.png)

Just a simple gamepad/joypad visualizer fot Godot Engine 3.x.
Basic inputs are associated to a joypad ID and showed on the respective gamepad representation.

## Using

Just instance the gamepad scene ("gamepad-input-visualizer\input-visualizer") in your scene (like the "Test-Scene") in the project) and associate it with an ID.
You can change the ID in the Script Variables: 0 is the main controller connected.
Device ID are treated as
```gdscript
export (int) var current_device
```
Interpolation Stick is the value used to interpolate the movements of the sticks from their respective origin. Higher the value higher the constraint.

## TODO

-Different methods for spawn, connect and disconnect devices in real time.
<br><br>
-Improve design and give some possibilities of design customization.
<br><br>
-Optimize for standalone use. 
