extends Spatial

var x
var y
var z
var isDrag = true

var isbarel_enter = false #bool for barel is in position
var isSpring_enter = false # bool for spring if in position
var isSlide_main_enter = false #bool for slide_main
var slide_disable = true
onready var slide_main = $"%slide_main"
var isSlideDrag = true

signal send_instruction(val)
# Called when the node enters the scene tree for the first time.

#Slide
var move_slide
#func _process(delta):
#	if Input.is_action_just_pressed("click"):
#		if move_slide:
#			isSlideDrag = true
#			print("click")
##			ToPosition(hovered)

#func _on_slide_area_mouse_entered():
#	print(get_node("."))
##	move_slide = get_node("slide/slide_mesh/slide_area")
#
#func _on_slide_area_input_event(camera, event, position, normal, shape_idx):
#	pass

#func _on_Draggable_slide_drag_stop(node):
#	if isSlide_main_enter:
#		var in_position = Vector3(-0.069, 0.5, 0.802)
##		emit_signal("send_instruction", 4)
#		slide_main.set_translation(in_position)
func _on_Draggable_slide_drag_move(node, cast):
	if isSlideDrag:
		print("ok")
		x = cast.position.x
		y = 0.5
		z = (cast.position.z + 2)
		var to_position = Vector3(x, y, z)
		slide_main.set_translation(to_position)
	if isSlide_main_enter:
		var in_position = Vector3(-0.069, 0.5, 0.802)
		emit_signal("send_instruction", 4)
		slide_main.set_translation(in_position)
		slide_disable = true

	
func _on_Global_slide_area_lock(value):
	print(value)
	isSlide_main_enter = value

	
#barel
onready var spring_area = $spring/sping/spring_area

func _on_Draggable_barrel_drag_move(node, cast):
	if isDrag:
		spring_area.set_visible(false)
		var node_to_move = get_node("barel")
		x = cast.position.x
		y = 0
		z = (cast.position.z + 2)
		var to_position = Vector3(x, y, z)
		node_to_move.set_translation(to_position)


onready var barel = $"%barel"
func _on_Draggable_barrel_drag_stop(node):
	if isbarel_enter:
		var in_position = Vector3(-2.174, 0, -2.187)
#		emit_signal("send_instruction", 2)
		barel.set_translation(in_position)
		barel.get_node("barel_mesh/barrel_area").set_visible(false)
		isDrag = false
		spring_area.set_visible(true)
		
#		slide_disable = false


#spring
func _on_SpringDrag_drag_move(node, cast):
	var node_to_move = get_node("spring")
	x = cast.position.x + 1
	y = 0
	z = (cast.position.z + 2.1)
	var to_position = Vector3(x, y, z)
	node_to_move.set_translation(to_position)
	
onready var spring = $"%spring"
func _on_SpringDrag_drag_stop(node):
	if isSpring_enter:
		var in_position = Vector3(-1.737, 0, -1.698)
		spring.set_translation(in_position)
		spring.get_node("sping/spring_area").set_visible(false)		



#on landing area

func _on_barel_area_area_entered(area):
	print_debug(area.get_parent().get_parent())
	var barel = area.get_parent().get_parent()
	if barel:
		emit_signal("send_instruction", 2)
		isbarel_enter = true

func _on_barel_area_area_exited(area):
	if area.name == "barrel_area":
		emit_signal("send_instruction", 1)
		isbarel_enter = false

func _on_spring_area_area_entered(area):
	if area.name == "spring_area":
		emit_signal("send_instruction", 3)
		get_node("slide/slide_mesh/slide_area").set_visible(true)
		isSpring_enter = true
		slide_disable = false
		isDrag = true
		print_debug(isDrag)
		var x = -1
		var y = 0
		var z = -1
		var to_position = Vector3(x, y, z)
		slide_main.set_translation(to_position)
			
#		spring_area.set_visible(false)

#
#func _on_spring_area_area_exited(area):
#	var spring = area.get_parent().get_parent()
#	if spring:
#		emit_signal("send_instruction", 2)
#		isSpring_enter = false


func _on_Global_area_lock(value):
	print_debug(value)
	isSpring_enter = value



