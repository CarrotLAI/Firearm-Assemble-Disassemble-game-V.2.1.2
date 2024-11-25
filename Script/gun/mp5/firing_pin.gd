extends Spatial

signal remove_firingPin(val)

var phaseOne = true
var phaseTwo = false

var x; var y; var z; var nextPos = Vector3()
onready var vertical_area = $"%vertical_area"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	if phaseOne:
		PhaseOne(node, cast)
	if phaseTwo:
		PhaseTwo(node, cast)

func PhaseOne(node, cast):
	x = cast.position.x
	y = cast.position.y
	z = cast.position.z
	nextPos = Vector3(-x, 0, 0)
	set_translation(nextPos)
	if x < -5:
		phaseOne = false
		phaseTwo = true

func PhaseTwo(node, cast):
	emit_signal("remove_firingPin", true)
	vertical_area.set_visible(true)
	x = cast.position.x
	y = cast.position.y 
	z = cast.position.z
	nextPos = Vector3(-x, y, 0)
	if cast.position.y > y:
		set_translation(nextPos)


func _on_Draggable_drag_stop(node):
	set_translation(nextPos)
