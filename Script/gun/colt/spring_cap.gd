extends Spatial


#signals
signal spring_remove(value)

# Declare member variables here. Examples:
var x
var y
var z
var nextPos = Vector3()

#conditions
var drag_to_outside = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	
	if(drag_to_outside):
		Drag_outside(node, cast)
	
	
	
		
func Drag_outside(node, cast):
	
#	var spring_cap = get_node(".")
	var x = get_node(".").transform.origin.x
	var y = cast.position.y - 3.2
	var z = -(cast.position.x)
	if(z >= 0 && z <= 6.2):
		nextPos = Vector3(0, 0, z)
		set_translation(nextPos)
	if(z == 6):
		Default_position(node, cast)

func Default_position(node, cast):
	var slide_part = get_parent().get_parent().get_node("slide/slide_area")
	var default_position = Vector3(0,0,-6.2)
	set_translation(default_position)
	slide_part.set_visible(true)
	print(get_node('.'))
	emit_signal("spring_remove", true)
	
