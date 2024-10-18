extends Spatial


#signals
signal spring_remove(value)

# Declare member variables here. Examples:
var x
var y
var z
var nextPos = Vector3()

onready var slide = $"%slide"

#conditions
var drag_to_outside = true

func _on_Draggable_drag_move(node, cast):
	
	if(drag_to_outside):
		Drag_outside(node, cast)
	
	
#change it to onclick
func Drag_outside(node, cast):
#	var spring_cap = get_node(".")
	var x = get_node(".").transform.origin.x
	var y = cast.position.y - 3.2
	var z = -(cast.position.x)
#	if(z >= 0 && z <= 6.4):
	nextPos = Vector3(0, 0, 6)
#	print_debug(z)
	set_translation(nextPos)
	if(get_node(".").transform.origin.z >= 6):	
		Default_position(node, cast)
		drag_to_outside = false

func Default_position(node, cast):
	slide.get_node("slide_area").set_visible(true)
	print_debug("Default_position")
	var default_position = Vector3(0,0,6)
	set_translation(default_position)
#	emit_signal("spring_remove", true)
	
