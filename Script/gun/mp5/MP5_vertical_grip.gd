extends Spatial


# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	x = (cast.position.x) + 3.5
	y = cast.position.y - 4
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y, z)
	print(cast.position)
	set_translation(nextPos)
