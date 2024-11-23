extends Spatial

signal remove_recoilSpring(val)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var phaseOne = true
var phaseTwo = false

onready var bolt_head = $"%bolt_head"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	if phaseOne:
		PhaseOne(node, cast)
	if phaseTwo:
		PhaseTwo(node, cast)

func _on_Draggable_drag_stop(node):
	set_translation(nextPos)

func PhaseOne(node, cast):
	var x = cast.position.x
	var y = cast.position.y
	var z = cast.position.z
	nextPos = Vector3(-x, 0, 0)
#	print(x)
	set_translation(nextPos)
	if x > 4:
		phaseOne = false
		phaseTwo = true

func PhaseTwo(node, cast):
	bolt_head.set_visible(true)
	emit_signal("remove_recoilSpring", true)
	var x = cast.position.x
	var y = cast.position.y - 10
	var z = cast.position.z
	nextPos = Vector3(-x, y, 0)
	if cast.position.y > y:
		y += y
		set_translation(nextPos)
