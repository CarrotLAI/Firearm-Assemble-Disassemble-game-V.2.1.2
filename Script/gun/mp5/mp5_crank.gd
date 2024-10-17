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
	x = -(cast.position.x + 4)
	y = 0
	z = 0
	nextPos = Vector3(x, y, z)
	set_translation(nextPos)
