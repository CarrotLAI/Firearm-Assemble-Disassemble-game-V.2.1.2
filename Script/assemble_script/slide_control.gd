extends Spatial

var x
var y
var z

var isbarel_enter = false #bool for barel is in position
var isSpring_enter = false # bool for spring if in position
var isSlide_main_enter = false #bool for slide_main
var slide_disable = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Slide
func _on_Draggable_slide_drag_move(node, cast):
	if !slide_disable:
		x = cast.position.x
		y = 0.5
		z = (cast.position.z + 2)
		var to_position = Vector3(x, y, z)
		set_translation(to_position)

func _on_Draggable_slide_drag_stop(node):
	if isSlide_main_enter:
		var in_position = Vector3(-0.069, 0.5, 0.817)
		set_translation(in_position)
	
func _on_Global_slide_area_lock(value):
	isSlide_main_enter = value

	
#barel
func _on_Draggable_barrel_drag_move(node, cast):
	var node_to_move = get_node("barel")
	x = cast.position.x
	y = 0
	z = (cast.position.z + 2)
	var to_position = Vector3(x, y, z)
	node_to_move.set_translation(to_position)
	
func _on_Draggable_barrel_drag_stop(node):
	var area_lock = get_node("barel")
	if isbarel_enter:
		var in_position = Vector3(-2.174, 0, -2.187)
		area_lock.set_translation(in_position)
		slide_disable = false


#spring
func _on_SpringDrag_drag_move(node, cast):
	var node_to_move = get_node("spring")
	x = cast.position.x + 1
	y = 0
	z = (cast.position.z + 2.1)
	var to_position = Vector3(x, y, z)
	node_to_move.set_translation(to_position)

func _on_SpringDrag_drag_stop(node):
	var area_lock = get_node("spring")
	if isSpring_enter:
		var in_position = Vector3(-1.737, 0, -1.698)
		area_lock.set_translation(in_position)



#on landing area

func _on_barel_area_area_entered(area):
	print(area.get_parent().get_parent())
	var barel = area.get_parent().get_parent()
	if barel:
		isbarel_enter = true
		
func _on_spring_area_area_entered(area):
	print(area.get_parent().get_parent())
	var spring = area.get_parent().get_parent()
	if spring:
		isSpring_enter = true






