extends Spatial


#signals
signal spring_remove(value)
signal send_instruction(val)

# Declare member variables here. Examples:
var x
var y
var z
var nextPos = Vector3()
var hovered

onready var slide = $"%slide"

#conditions
var drag_to_outside = true

#func _on_Draggable_drag_move(node, cast):
#
#	if(drag_to_outside):
#		Drag_outside(node, cast)
	
	
#change it to onclick
#func Drag_outside(node, cast):
##	var spring_cap = get_node(".")
#	var x = get_node(".").transform.origin.x
#	var y = cast.position.y - 3.2
#	var z = -(cast.position.x)
##	if(z >= 0 && z <= 6.4):
#	nextPos = Vector3(0, 0, 6)
##	print_debug(z)
#	set_translation(nextPos)
#	if(get_node(".").transform.origin.z >= 6):	
#		Default_position(node, cast)
#		drag_to_outside = false

#func Default_position(node, cast):
func Default_position():
	slide.get_node("slide_area").set_visible(true)
	print_debug("Default_position")
	var default_position = Vector3(0,0,6)
	emit_signal("send_instruction", 4)
	set_translation(default_position)
#	emit_signal("spring_remove", true)
	


func _on_spring_cap_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			if hovered:
				Default_position()
				set_process(true)
		else:
			set_process(false)


func _on_spring_cap_area_mouse_entered():
	hovered = get_node("spring/spring_cap_area")
