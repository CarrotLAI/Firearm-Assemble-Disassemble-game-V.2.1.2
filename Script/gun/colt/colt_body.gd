extends Spatial

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var time_click = 0

func _ready():
	set_process(false)


#func _on_trigger_input_event(camera, event, click_position, click_normal, shape_idx):
#detecting input
func _on_slide_lock_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print(event)
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
#		rotating = true
		time_click =+ 1
		First_Time_Click(trigger)
#		trigger.
	if Input.is_action_just_released("click"):
#		rotating = false
		trigger = Vector3()
		set_process(false)	
		
#	if rotating:
#		next_mousePos = get_viewport().get_mouse_position()
#		trigger.rotate_z(-(next_mousePos.x - prev_mousePos.x) * .3 * delta)
#		prev_mousePos = next_mousePos
#
#	if rotation.z == 25:
#		print("true")
#		trigger.rotation_degrees = next_mousePos

#func _on_trigger_mouse_entered():
#	hovered = get_node('./Spatial/trigger')

func _on_slide_lock_mouse_entered():
	hovered = get_node("slide_lock_spatial")
	print(hovered)
	
func First_Time_Click(trigger):
	trigger = get_node("slide_lock_spatial")
	var x = -0.082
	var y = -0.234
	var z = 0.534
#	prev_mousePos = get_viewport().get_mouse_position()
	var next_position = Vector3(x, y, z)
	trigger.set_translation(next_position)
	trigger.rotation = Vector3(deg2rad(87), 0, 0)

func Second_Time_Click(trigger):
	pass
