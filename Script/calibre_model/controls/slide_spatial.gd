extends Spatial


# Declare member variables here. Examples:
var x
var y
var z
var hovered
var drag
var prev_mousePos
var next_mousePos


# Called when the node enters the scene tree for the first time.
#func _ready():
#	set_process(false)


func _process(delta):
	var trigger = hovered
#	var rotation = trigger.rotation_degrees
	if Input.is_action_just_pressed("click"):
		drag = true
		prev_mousePos = get_viewport().get_mouse_position()
	if Input.is_action_just_released("click"):
		drag = false
		trigger = Vector3()
		set_process(false)	
	
	if drag:
		next_mousePos = get_viewport().get_mouse_position()
		trigger.rotate_z(-(next_mousePos.x - prev_mousePos.x) * .3 * delta)
#		trigger.rotate_y(-(next_mousePos.z - prev_mousePos.z) * .3 * delta)
		prev_mousePos = next_mousePos
		
		print(prev_mousePos)
		
#var speed = 5.0
#var z_distance = 10.0
#
##func _on_Draggable_drag_move(node, cast):
##	x = (cast.position.x - cast.position.x) # x axis
##	y = 0 # y axis
##	z = (cast.position.z - cast.position.z) # this z axis
#
##	var elem = get_node(".")
##	print(elem)
#	var move_pos = Vector3(0, z, x)
#	set_translation(move_pos)
##	print(cast.position)
#	print(move_pos)


func _on_slide_area_mouse_entered():
	print("mouse enter")


func _on_slide_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			print(event)
			if hovered:
				set_process(true)
		else:
			set_process(false)
