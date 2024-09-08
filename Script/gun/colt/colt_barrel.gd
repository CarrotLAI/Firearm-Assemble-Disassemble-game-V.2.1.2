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
	x = cast.position.x
	y = cast.position.y - 3.5
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y, z)
#	print(cast.position)
	set_translation(nextPos)
