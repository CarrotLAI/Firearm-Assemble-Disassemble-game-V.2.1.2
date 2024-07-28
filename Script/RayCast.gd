extends RayCast
#
#var dragging = false
#var current_mouse_position
#var next_mouse_position
#var obj
#var condition_to_remove_slide = false
#export var collided = false
#
#func _physics_process(delta):
#
#	if self.is_colliding():
#		var collider = self.get_collider()
#		obj = collider.get_parent().get_parent().get_parent()
##		print(obj.get_parent().transform.origin)
##		dragging = true
#
#		current_mouse_position = get_viewport().get_mouse_position()
#		collided = true
#
#
##func stored_condition():
#
