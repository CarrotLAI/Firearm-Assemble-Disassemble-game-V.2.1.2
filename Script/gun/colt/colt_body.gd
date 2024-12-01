extends Spatial

signal send_instruction(val)

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var time_click = 0
var readyDragg = false
var nextPost
var obj

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
		emit_signal("send_instruction", 5)
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
	obj = trigger
	var x = -0.082
	var y = -0.234
	var z = 0.534
#	prev_mousePos = get_viewport().get_mouse_position()
	var next_position = Vector3(x, y, z)
	trigger.set_translation(next_position)
	trigger.rotation = Vector3(deg2rad(87), 0, 0)
	readyDragg = true

func Second_Time_Click(trigger):
	pass

func _on_Draggable_drag_move(node, cast):
	var	trigger = get_node("slide_lock_spatial")
	if readyDragg == true:
		var x = cast.position.x
		var y = cast.position.y - 10
		var z = -cast.position.x
		nextPost = Vector3(0, y, z)
		trigger.set_translation(nextPost)


func _on_Draggable_drag_stop(node):
	var	trigger = get_node("slide_lock_spatial")	
	trigger.set_translation(nextPost)
