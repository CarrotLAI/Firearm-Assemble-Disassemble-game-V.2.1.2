extends Spatial


# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var default_mag = true
onready var draggable = $"%Draggable"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	if(default_mag):
		x = cast.position.x
		y = cast.position.y
		z = get_node(".").transform.origin.z
		nextPos = Vector3(x, y, z)
	#	print(cast.position)
		set_translation(nextPos)


func _on_Global_magazine_enter(value):
	if(value == 1):
		var nextPos = Vector3(0.24, 0.488, 1.2)
		set_translation(nextPos)
		default_mag = false
		set_process(false)
