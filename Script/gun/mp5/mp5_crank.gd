extends Spatial

signal removeBullet(value)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var removeBullet = true
var drag = false
var defaultPost = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_Draggable_drag_move(node, cast):
	if removeBullet:
		PhaseOne(node, cast)
	if drag:
		PhaseTwo(node, cast)
	if defaultPost:
		DefaultPos(node, cast)
	
	
func PhaseOne(node, cast):
	var x = -(cast.position.x)
	var y = cast.position.y
	var z = 0
	nextPos = Vector3(x, 0, 0)
	set_translation(nextPos)
	if x <= -6:
		DefaultPos(node, cast)
func PhaseTwo(node, cast):
	x = -(cast.position.x + 4)
	y = 0
	z = 0
	nextPos = Vector3(x, y, z)
	set_translation(nextPos)

func DefaultPos(node, cast):
	x = 0
	y = 0
	z = 0
	nextPos = Vector3(1, 1, 1)
	set_translation(nextPos)
	emit_signal("removeBullet", true)
