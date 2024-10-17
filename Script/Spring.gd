extends Spatial


func _on_Draggable_drag_move(node, cast):
	var position = Vector3(cast.position.x, 0, cast.position.z)
	set_translation(position)
