extends Spatial


#onready var congratulations = $congratulations
#onready var imported_array = get_node("gun")
var to_win: Array = []
var objects = []
var dragging = false
var offset = Vector3()

#func _ready():
#	to_win = imported_array.condition_to_win
#	print(to_win)
#	get_node("congratulations").hide()
#	print_tree()

#func _input(event):
#	if to_win == [1, 1, 1, 1, 1]:
#		game_win()
#
#	game_over()
#	pass
	
func game_win():
	get_node("congratulations").show()
	pass
func game_over():
#	return to game 1
	pass


#func _on_Draggable_drag_move(node, cast):	
#	var position = Vector3(cast.position.x, 0, cast.position.z)
#	print(get_translation())
#	print_debug(cast.position)
#	for child in get_children():
#		if child.is_in_group("spring"):
#			print("true")
#			objects.append(child)
#
#	for obj in objects:
#		_input(cast)
#		obj.translation = position
#		obj.set_translation(position)
#	objects.translation(position)


#func _on_Draggable_drag_stop(node):
#	objects = []
#	return


#func _on_Draggable_slide_drag_move(node, cast):
#	var is_drag = false
#	var offset 
#	var posX 
#	var posZ 
#	var newPos
#	var drag_offset = cast.collider.get_parent().transform.origin#floor origin
##	var position = Vector3(drag_offset.x, 0, drag_offset.z)
#	var slide_node = get_node("%slide/Spatial")
#	is_drag = true
#	posX = 0
#	posZ = 0
##	print(slide_node)
##	if the condition is not met, or if the slide is not outside of the area drag the group
#	if to_win[1] == 1: 
#		get_node("%slide").set_translation(cast.position)
#
#
#	if is_drag:
#
#		offset = (self.transform.origin)
#		posX = (offset.x - cast.position.x) * .1
#		posZ = (offset.z - cast.position.z) * .1
#		newPos = Vector3(cast.position.x, 0,cast.position.z)
#		slide_node.set_translation(newPos)
#
##		print("translation: ", offset.x)
##		print("casthit: ", cast.position.x)
##		slide_node.set_translation(newPos)
#	is_drag = false
#	return Vector3()
