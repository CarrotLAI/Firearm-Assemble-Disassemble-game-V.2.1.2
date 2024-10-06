extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	var x = get_node(".").transform.origin.z
	var y = cast.position.y
	var z = -(cast.position.x)
	var nextPos = Vector3(0, y, z)
	print(nextPos)
	set_translation(nextPos)
