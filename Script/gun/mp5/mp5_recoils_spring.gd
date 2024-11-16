extends Spatial

signal remove_recoilSpring(val)

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
	x = -(cast.position.x)
	y = 0
	z = 0
	nextPos = Vector3(x, y, z)
#	print(cast.position)
	set_translation(nextPos)


func _on_Draggable_drag_stop(node):
	print("drop")
	set_translation(nextPos)

func PhaseOne(node, cast):
	var x = cast.position.x
	var y = cast.position.y
	var z = cast.position.z
	nextPos = Vector3(x, 0, z)
	set_translation(nextPos)