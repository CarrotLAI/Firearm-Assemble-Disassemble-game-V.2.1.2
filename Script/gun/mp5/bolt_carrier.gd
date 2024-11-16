extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x
var y
var z
var nextPos = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var firing_pin = $"%Firing_Pin"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	x = cast.position.x
	y = cast.position.y
	z = cast.position.z
	nextPos = Vector3(x, y, z)
	set_translation(nextPos)


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		x = 1
		y = 1
		z = 1
		nextPos = Vector3(x, y, z)
		firing_pin.set_translation(nextPos)
