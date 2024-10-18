extends Spatial

onready var spring = $"../spring"
onready var slide_main = $"%slide_main"
onready var imported_array = get_node('gun')
onready var barel = $"%barel"

#var scene = preload("res://Scene/barel.tscn")
#var instance = scene.instance()
var objects = []
var camera
var drag_to_right = true
var drag_to_left = false
var start_drag = true
var bullet_remove = false
var slide_remove = false
var slide_lock_open = false
var offset 
var posX 
var posZ 
var newPos
var disable_barel = true
var remove_spring = false;

#fix later the mouse position
func _physics():
	pass 

func _on_Draggable_drag_move(node, cast):
#	var drag_offset = cast.collider.get_parent().transform.origin#floor origin
#	var position = Vector3(drag_offset.x, 0, drag_offset.z)
#	print(GRayCast.condition_to_remove_slide)
#	var slide_lock = GCondition.slide_lock_open
	if drag_to_right:
		remove_bullet(node, cast)
	if slide_lock_open:
		remove_slide(node, cast)
		
		
		
#	set_translation(offset.z)
#	if Input.is_action_just_pressed("ui_touch") || Input.is_action_just_pressed("click"):
##		is_drag = true:
	
##		set_translation(newPos)
#	return Vector3()
#
func remove_bullet(node, cast):
	var slide = get_node("./slide")
	offset = (slide.transform.origin)
#	print(offset)
	posX = cast.position.x
#	posZ = (offset.z - cast.z)
	newPos = Vector3( posX, offset.y, offset.z)
	if posX <= 1.63 and posX >=0.63:
#			print("translation: ", offset)
#			print("casthit: ", cast.position)
		slide.set_translation(newPos)
	if !bullet_remove:
		print("remove bullet")
		bullet_remove = true
		
	return Vector3()
	
#		_on_Draggable_slide_drag_stop(node)
	
func remove_slide(node, cast):
	var translate = (slide_main.transform.origin)
#	drag_to_right = false
#	print("translate: ", translate.x)
#	print("cast: ",cast.position.x)
	posX = cast.position.x
	posZ = cast.position.z
	newPos = Vector3(posX, translate.y, translate.z)
	#if it's still inside of the area:
	if posX <= -0 and posX >= -1.4:
		if start_drag:
			slide_main.set_translation(newPos)
		#if outside of the area
			if posX <= -1.3:
				slide_remove = true
				start_drag = false
				print(slide_remove)
#	set_translation((Vector3() * .1))
	if slide_remove:
		newPos = Vector3( posX, translate.y, posZ)
		slide_main.set_translation(newPos)
		
#	set_translation(cast.)

func _on_Draggable_slide_drag_stop(node):
	
	var slide = get_node("./slide")
#	var position = slide.transform.origin
	print("stop")
	var oldPos = Vector3() * .1	
	slide.set_translation(oldPos)
	if slide_remove:
		#set rotation degrees
		pass
	
	
#func _on_Draggable_drag_stop(node):
#	is_drag = false


func _on_SpringDrag_drag_move(node, cast):
#	var draggable = get_node("Spatial/slide/slide/Draggable_slide")
#	draggable.disconnect("Draggable_slide", self, "_on_SpringDrag_drag_move")
#	var prev_position = get_viewport().get_mouse_position()
#	var next_position = get_viewport().get_mouse_position()
#	var current_mouse = (prev_position - next_position) - 
	var spring = get_node("%spring")
	offset = (spring.transform.origin)

#	var drag_offset = lerp(offset, cast.position, 25 * 1)	
	var x = cast.position.x + 1.2
	var z = cast.position.z + 3
	var nextPos = Vector3(x, offset.y, z)
	spring.set_translation(nextPos)
	if nextPos.x < -1.1 or nextPos.x > -0.4:
		disable_barel = false
		remove_spring = true
	if remove_spring == true:
		var updatePosition = Vector3(x, offset.y, z)
#func _on_spring_area_input_event(camera, event, position, normal, shape_idx):
#		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#			if event.is_pressed():
#



func _on_slide_area_exited(area):
	print(area)

#fix this later with spring
#fix there origin
func _on_Draggable_barrel_drag_move(node, cast):
	if disable_barel == false:
#		var prev_position = get_viewport().get_mouse_position()
#		var next_position = get_viewport().get_mouse_position()
#		var current_mouse = -(prev_position.y - next_position.y) *.1
		var barel_position = barel.transform.origin
		var x = cast.position.x
		var z = (cast.position.z + 3)
#	print(positionZ, " ", barel_position.z)
		var newPos = Vector3(x, barel_position.y, z)
		barel.set_translation(newPos)


func _on_slide_lock_input_event(camera, event, position, normal, shape_idx):
	if event.is_pressed():
		slide_lock_open = true
		print(slide_lock_open)


