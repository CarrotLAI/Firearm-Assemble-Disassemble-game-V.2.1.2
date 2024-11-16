extends Spatial

signal remove_verticalGrip(val)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var remove_vertGrip = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	if remove_vertGrip:
		PhaseOne(node, cast)
	
#	var x = nextPos.x + 4 
#	var y = nextPos.y - 4 
#	var z = nextPos.z - 4 
	# var nextPosition = Vector3(x, y, 0)
#	print(cast.position)

func _on_wall_drag_pos(cast):
	nextPos = cast
#	print(cast)

func PhaseOne(node, cast):
	x = (cast.position.x) + 3.5
	y = cast.position.y - 4
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y, z)
	set_translation(nextPosition)

