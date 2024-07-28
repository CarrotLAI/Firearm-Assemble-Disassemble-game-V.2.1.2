extends Spatial

var drag_offset = Vector3()

func _on_Draggable_drag_move(node, cast):
	print(drag_offset)
	set_translation(cast['position'] )
	
