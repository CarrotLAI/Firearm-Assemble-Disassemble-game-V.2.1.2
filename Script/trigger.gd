extends Spatial

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false

func _ready():
	set_process(false)


#detecting input
func _on_trigger_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			if hovered:
				set_process(true)
		else:
			set_process(false)
	
#Responsible for rotating the trigger to z=25
func _process(delta):
	var trigger = hovered
#	var rotation = trigger.rotation_degrees
	
	if Input.is_action_just_pressed("click"):
		rotating = true
		prev_mousePos = get_viewport().get_mouse_position()
	if Input.is_action_just_released("click"):
		rotating = false
		trigger = Vector3()
		set_process(false)	
		
	if rotating:
		next_mousePos = get_viewport().get_mouse_position()
		trigger.rotate_z(-(next_mousePos.x - prev_mousePos.x) * .3 * delta)
		prev_mousePos = next_mousePos
	
#	if rotation.z == 25:
#		print("true")
#		trigger.rotation_degrees = next_mousePos

func _on_trigger_mouse_entered():
	hovered = get_node('./Spatial/trigger')

