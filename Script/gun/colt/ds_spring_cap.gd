extends Spatial


#signals
signal spring_remove(value)

# Declare member variables here. Examples:
var x
var y
var z
var nextPos = Vector3()

signal send_instruction(val)

onready var slide = $"%slide"
onready var spring = $"%spring"
onready var colt_slide_area = $"%colt_slide_area"

#conditions
var drag_to_default = true

func _on_Draggable_drag_move(node, cast):
	
	if(drag_to_default):
		Drag_default(node, cast)
	

onready var spring_cap_area = $"%spring_cap_area"
#change it to onclick
func Drag_default(node, cast):
	nextPos = Vector3(0, 0, 0)
	set_translation(nextPos)
	slide.get_node("colt_slide_area").set_visible(true)
	drag_to_default = false
	emit_signal("send_instruction", 5)
	spring_cap_area.set_visible(false)
	colt_slide_area.set_visible(true)
#	emit_signal("spring_remove", true)	


func _on_Draggable_drag_stop(node):
	pass # Replace with function body.


func _on_spring_cap_area_area_entered(area):
	pass # Replace with function body.
