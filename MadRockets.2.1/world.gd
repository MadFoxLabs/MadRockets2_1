extends Node2D

@onready var speed = $Objects/Speed
@onready var gravity = $Objects/Gravity
@onready var camera_speed = $Objects/Speed/Anvil/CameraSpeed
@onready var camera_gravity = $Objects/Gravity/Anvil/CameraGravity


func _on_button_1_button_up():
	
	speed.visible = true
	gravity.visible = false
	
	reset_position_all_objects()
	camera_speed.enabled = true
	camera_gravity.enabled = false
	
	no_air()

func no_air():
	for o in gravity.get_children():
		o.force_air_on = false
		
func use_air():
	for o in gravity.get_children():
		o.force_air_on = true

func _on_button_2_button_up():
	#get_tree().reload_current_scene()
	
	speed.visible = false
	gravity.visible = true
	
	reset_position_all_objects()
	camera_speed.enabled = false
	camera_gravity.enabled = true


func turn_speed_visible_only():
	
	speed.visible = true
	gravity.visible = false


func reset_position_all_objects():
	for o in speed.get_children():
		o.position = Vector2(o.position.x, 60)
	for o in gravity.get_children():
		o.reset_state = true


func _on_button_4_button_up():
	speed.visible = true
	gravity.visible = true
	
	reset_position_all_objects()
	camera_speed.enabled = false
	camera_gravity.enabled = true


func _on_button_3_button_up():
	pass # Replace with function body.


func _on_button_3_toggled(toggled_on):
	if toggled_on:
		use_air()
	else:
		no_air()


func _on_button_5_button_up():
	get_tree().reload_current_scene()
