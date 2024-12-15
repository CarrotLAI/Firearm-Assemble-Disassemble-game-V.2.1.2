extends Spatial

signal send_instruction(val)

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var time_click = 0
var readyDragg = true
var nextPost
var obj

func _ready():
	set_process(false)


#func _on_trigger_input_event(camera, event, click_position, click_normal, shape_idx):
#detecting input
#func _on_slide_lock2_input_event(camera, event, position, normal, shape_idx):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		print(event)
#		if event.is_pressed():
#			if hovered:
#				set_process(true)
#				First_Time_Click()
#		else:
#			set_process(false)

	
#Responsible for rotating the trigger to z=25
#func _process(delta):
#	var trigger = hovered
##	var rotation = trigger.rotation_degrees
#	if Input.is_action_just_pressed("click"):
#
#
#
#	if Input.is_action_just_released("click"):
#		set_process(false)	
#
#func First_Time_Click():
#	var trigger = get_node("slide_lock_spatial")
#	var x = 0.247
#	var y = -1.914
#	var z = -1.148
##	var next_position = Vector3(x, y, z)
##	trigger.set_translation(next_position)
#	trigger.rotation_degrees = Vector3(73.227, 0, 0)
#	trigger.set_visible(true)
#	readyDragg = true	

func Second_Time_Click(trigger):
	pass

func _on_Draggable_drag_move(node, cast):
	var	trigger = get_node("slide_lock_spatial")
	if readyDragg == true:
		var x = cast.position.x-5
		var y = cast.position.y - 5
		var z = -cast.position.x
		nextPost = Vector3(0, y, z)
		trigger.set_translation(nextPost)


func _on_Draggable_drag_stop(node):
	var	trigger = get_node("slide_lock_spatial")	
	trigger.set_translation(nextPost)


#
#func _on_slide_lock2_mouse_entered():
#	hovered = get_node("slide_lock_spatial")
#

func _on_Area_condition_area_exited(area):
#	print_debug(area.name)
	if area.name == "slide_lock2":
		emit_signal("send_instruction", 5)
