extends Spatial

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var phaseOne = true


func _ready():
	pass # Replace with function body.


func _on_Draggable_drag_move(node, cast):
	if phaseOne:
		Phase_one(node, cast)

#drag down
func Phase_one(node, cast):
	x = cast.position.x
	y = cast.position.y
	z = cast.position.z
	var _position = Vector3(2, y, 0)
	set_translation(_position)
	if y != 0:
#		print(_position)
		phaseOne = false
#	if position is out free to drag

func Phase_two(node, cast):
	x = cast.position.x
	y = cast.position.y
	z = 0
	nextPos = Vector3(x+1.8, y-3, z)
	print(cast.position)
	set_translation(nextPos)
