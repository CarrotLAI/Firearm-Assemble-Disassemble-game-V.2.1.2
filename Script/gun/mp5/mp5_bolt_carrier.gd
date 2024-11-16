extends Spatial

signal remove_boltCarrier(val)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var rm_boltCarrier = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	if rm_boltCarrier:
		removeBoltCarrier(node, cast)

func removeBoltCarrier(node, cast):
	x = cast.position.x
	y = cast.position.y - 6.5
	z = 0
	nextPos = Vector3(x, y, z)
	set_translation(nextPos)

func DefaultPosition(node, cast):
	x = 1
	y = 1
	z = 1
	nextPos = Vector3(x, y, z)
	set_translation(nextPos)
	emit_signal("remove_boltCarrier", true)