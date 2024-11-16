extends Spatial


# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var time_click = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Draggable_drag_move(node, cast):
	x = cast.position.x - 4
	y = cast.position.y
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y-3, z)
	print(cast.position)
	set_translation(nextPos)

func _process(delta):
	var trigger = hovered
#	var rotation = trigger.rotation_degrees
	if Input.is_action_just_pressed("click"):
#		rotating = true
		time_click =+ 1
#		First_Time_Click(trigger)
#		trigger.
	if Input.is_action_just_released("click"):
#		rotating = false
		trigger = Vector3()
		emit_signal("send_instruction", 5)
		set_process(false)	

func _on_lock_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print(event)
		if event.is_pressed():
			if hovered:
				set_process(true)
		else:
			set_process(false)

#func First_Time_Click(trigger):
#	trigger = hovered
#	var x = 10
#	var y = 0
#	var z = -10
##	prev_mousePos = get_viewport().get_mouse_position()
#	var next_position = Vector3(x, y, z)
#	trigger.set_translation(next_position)
#	trigger.rotation = Vector3(deg2rad(0), 45, 0)
#	print_debug(next_position)


func _on_lock_mouse_entered():
	hovered = get_node("Selector_Lever001_mesh_199_mesh_199001")
	print(hovered)