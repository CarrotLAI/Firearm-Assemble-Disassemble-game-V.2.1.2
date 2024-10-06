extends Spatial


# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	x = get_node(".").transform.origin.z
	y = cast.position.y - 3.5
	z = -(cast.position.x)
	nextPos = Vector3(0, y, z)
	print_debug(cast.position)
	set_translation(nextPos)
	
