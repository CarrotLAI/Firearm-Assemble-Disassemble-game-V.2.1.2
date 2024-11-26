extends Spatial

signal remove_verticalGrip(val)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var drag_vertGrip = true
var phaseTwo = false

# Called when the node enters the scene tree for the first time.
#func _ready():
#	set_process(false)

func _on_Draggable_drag_move(node, cast):
	if drag_vertGrip:
		PhaseOne(node, cast)
#	if phaseTwo:
#		PhaseTwo(node, cast)
#	var x = nextPos.x + 4 
#	var y = nextPos.y - 4 
#	var z = nextPos.z - 4 
	# var nextPosition = Vector3(x, y, 0)
#	print(cast.position)

#func _on_wall_drag_pos(cast, val):
#	if val == true:
#		nextPos = cast
#		x = (cast.x) + 3.5
#		y = cast.y - 4
#		z = get_node(".").transform.origin.z
#		nextPos = Vector3(x, y, z)
#		set_translation(nextPos)
#	if val == false:
		
#	print(cast)

func PhaseOne(node, cast):
	x = (cast.position.x) + 3.5
	y = cast.position.y - 4
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y, 1.2)
	set_translation(nextPos)
#	if y - 3:
#		remove_vertGrip = false 
#		phaseTwo = true

#func PhaseTwo(node, cast):
#	x = (cast.position.x) + 3.5
#	y = cast.position.y - 4
#	z = get_node(".").transform.origin.z
#	nextPos = Vector3(x, y, z)
#	set_translation(nextPos)


func _on_Draggable_drag_stop(node):
	if phaseTwo:
		set_translation(nextPos)
		emit_signal("remove_verticalGrip", true)


func _on_vertical_area_area_exited(area):
	print(area.name)
	if area.name == "front_grip":
		phaseTwo = true


func _on_Global2_defaultVertical(val):
	drag_vertGrip = false
	nextPos = Vector3(1.742, 3.625, 1.2)
	set_translation(nextPos)
