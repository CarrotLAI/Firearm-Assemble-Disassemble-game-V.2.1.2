extends Spatial



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpringDrag_drag_move(node, cast):
	
	var spring = get_node("%spring")
	var newPos = Vector3(cast.position.x, 0, cast.position.z)
	print(newPos)
	spring.set_translation(newPos)
