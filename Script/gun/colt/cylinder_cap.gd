extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isCast = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Draggable_drag_move(node, cast):
	if(isCast):
		Default_Pos(node, cast)
	
	
	
func Default_Pos(node, cast):
	var x = cast.position.x
#	get_node(".").transform.origin.x
	var y = cast.position.y - 3.2
	var z = -(cast.position.x) + 1.3
#	if(z >= 0 && z <= 6.4):
	var nextPos = Vector3(0, 0, 5)
	set_translation(nextPos)
	isCast = false
