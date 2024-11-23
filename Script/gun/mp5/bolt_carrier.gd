extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x
var y
var z
var i = 10
var nextPos = Vector3()

var phaseOne = true
var phaseTwo = false

onready var firing_pin = $"%Firing_Pin"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
	if x > 5:
		phaseOne = false
		phaseTwo = true

func PhaseTwo(node, cast):
	x = cast.position.x
	y = cast.position.y - i
	z = cast.position.z
	nextPos = Vector3(-x, y, 0)
	if cast.position.y > y:
		i -= i
	set_translation(nextPos)
	

func _on_Draggable_drag_stop(node):
	set_translation(nextPos)
