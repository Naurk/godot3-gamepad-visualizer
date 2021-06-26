extends Node2D

export (float) var INTERPOLATION_STICK = 8
export (int) var current_device
var available_buttons = []

func _ready():
	for btns in get_child(0).get_children():
		available_buttons.append(btns.get_name())
	#print(available_buttons)
	
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	#Checks what status is right now
	if Input.get_connected_joypads().size() == 0:
		print("No Controller Connected")
	else:
		#Gets controller type
		print(Input.get_joy_name(Input.get_connected_joypads()[0]), ", id ", current_device, " connected")
		#current_device = Input.get_connected_joypads()[0]
		
func _on_joy_connection_changed(device_id, connected):
	if connected:
		print(Input.get_joy_name(device_id), ", id: ", device_id, " connected")
	else:
		print(device_id, " disconnected")
		if Input.get_connected_joypads().size() == 0:
			print("No Controller Connected")
			
func _input(event):
	if (event as InputEventJoypadButton) and event.device == current_device: 
		if available_buttons.has(str(event.get_button_index())):
			if event.is_pressed():
				get_child(0).get_node(str(event.get_button_index())).set_pressed(1)
			if !event.is_pressed():
				get_child(0).get_node(str(event.get_button_index())).set_pressed(0)
				
		
func _physics_process(delta):
	var left_stick_motion = Vector2(Input.get_joy_axis(current_device, JOY_AXIS_0), Input.get_joy_axis(current_device, JOY_AXIS_1))
	left_stick_motion.normalized()
	get_node("TextureRect/8").rect_position = Vector2(lerp(get_node("TextureRect/8").rect_position.x - clamp((-left_stick_motion.x * 2),-3,3), 3, delta * INTERPOLATION_STICK), lerp(get_node("TextureRect/8").rect_position.y - clamp((-left_stick_motion.y * 2), -3, 3), 6, delta * INTERPOLATION_STICK))
	
	var right_stick_motion = Vector2(Input.get_joy_axis(current_device, JOY_AXIS_2), Input.get_joy_axis(current_device, JOY_AXIS_3))
	right_stick_motion.normalized()
	get_node("TextureRect/9").rect_position = Vector2(lerp(get_node("TextureRect/9").rect_position.x - clamp((-right_stick_motion.x * 2), -3, 3), 102, delta * INTERPOLATION_STICK), lerp(get_node("TextureRect/9").rect_position.y - clamp((-right_stick_motion.y * 2),-3,3), 6, delta * INTERPOLATION_STICK))
	
	$ControllerPopup.set_text("Controller ID: " + str(current_device))
