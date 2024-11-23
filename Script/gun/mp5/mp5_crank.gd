extends Spatial

signal removeBullet(value)
signal startGame(value)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var removeBullet = true
var drag = false
var defaultPost = false

# Called when the node enters the scene tree for the first time.
onready var magazine_area = $"%magazine_area"


func _on_crank_Area_input_event(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print(event)
		emit_signal("startGame", true)

func _on_Draggable_drag_move(node, cast):
	if removeBullet:
		PhaseOne(node, cast)
#	if drag:
#		PhaseTwo(node, cast)
	if defaultPost:
		DefaultPos(node, cast)
	
	
func PhaseOne(node, cast):
	var x = -(cast.position.x) - 3
	var y = cast.position.y
	var z = 0
	nextPos = Vector3(x, 0, z)
	set_translation(nextPos)
	if x > 0:
		nextPos = Vector3(0, 0, 0)	
	if x <= -6:
		DefaultPos(node, cast)
		removeBullet = false
		
#func PhaseTwo(node, cast):
#	x = -(cast.position.x + 4)
#	y = 0
#	z = 0
#	nextPos = Vector3(x, y, z)
#	set_translation(nextPos)

func DefaultPos(node, cast):
	nextPos = Vector3(0, 0, 0)
	set_translation(nextPos)
	emit_signal("removeBullet", true)
	emit_signal("removeBullet", false)
	magazine_area.set_visible(true)

func _on_Draggable_drag_stop(node):
	var default = Vector3(0, 0, 0)
	set_translation(default)
