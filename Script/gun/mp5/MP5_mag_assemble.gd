extends Spatial

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var phaseOne = true
var phaseTwo = false

onready var lock_area = $"%lock_area"


#func _on_Draggable_drag_stop(node):
#	set_translation(nextPos)

func _on_Draggable_drag_move(node, cast):
	if phaseOne:
		Phase_one(node, cast)		
#	if phaseTwo:
#		Phase_two(node, cast)

#drag down
func Phase_one(node, cast):
	x = cast.position.x+2
	y = cast.position.y - 3
	z = cast.position.z
	var _position = Vector3(x, y, 1.2)
	set_translation(_position)
#	if y < 0:
#		phaseOne = false
#		phaseTwo = true
#	if position is out free to drag

#func Phase_two(node, cast):
#	x = cast.position.x
#	y = cast.position.y
#	z = 0
#	nextPos = Vector3(x+2, y-3, z)
#	set_translation(nextPos)
#	lock_area.set_visible(true)
	

onready var vertical_area = $"%vertical_Area"

func _on_Global2_defaultmag(val):
#	x = cast.position.x+2
#	y = cast.position.y - 3
#	z = cast.position.z
	vertical_area.set_visible(true)
	phaseOne = false
	var _position = Vector3(1.613, 4.061, 1.2)
	set_translation(_position)
