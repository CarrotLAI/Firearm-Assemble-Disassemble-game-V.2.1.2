extends Spatial


#signals
signal slide_condition(value)
signal move_parent(value)
signal send_instruction(val)
signal instruction_click_slide(val)
# Declare member variables here. Examples:
#var x 
#var y 
#var z
var nextPos = Vector3()
var isClick = true
var to_default = false
var drag_to_left = false
var remove_to_body = false
var isSlide = false
var isSlide_for_lock = false
var hovered
# Called when the node enters the scene tree for the first time.
onready var colt_slide_area = $"%colt_slide_area"

#onready var spring_cap = $"%spring_cap"
#onready var cylinder_cap = $"%cylinder_cap"
#onready var colt_barrel = $"%colt_barrel"
#onready var colt_barrel_cap = $"%colt_barrel_cap"
onready var colt_slide_parent = $"%colt_slide_parent"
#onready var mag_area = $"%mag_area"
#onready var barrel_area = $"../barrel_area"
#onready var spring_area = $"../spring_area"


func _ready():
	get_parent().get_node("barrel_area").set_visible(false)
	get_parent().get_node("spring_area").set_visible(false)
#	barrel_area.set_visible(false)
#	spring_area.set_visible(false)
#var draggable_node
func _on_Draggable_drag_move(node, cast):
	if isClick:
		nextPos = Vector3(-0.2, 0.5, 1.2)
		colt_slide_parent.set_translation(nextPos)
		emit_signal("instruction_click_slide", true)
		isClick = false
		to_default = true
		
	if(to_default):
		drag_to_default(node, cast)

func drag_to_default(node, cast):
	var x = cast.position.x + 2
	var y = cast.position.y - 4
	var z = get_node(".").transform.origin.z
	if x < 1.52 && x > 0.5:
		nextPos = Vector3(x, 0.5, 1.2)
		colt_slide_parent.set_translation(nextPos)
#	if x == 1.52:
#		x = 1.52
	if x >= 1.52:
		to_default = false
		emit_signal("send_instruction", true)
		colt_slide_area.set_visible(false)
	
func spring_remove(value):
	if (value):
		isSlide_for_lock = value
	
func _on_Draggable_drag_stop(node):
	colt_slide_parent.set_translation(nextPos)
#	print_debug(get_node('.'))
#	var slide = slide
#	if(isSlide == true):
#
#func _on_spring_cap_spring_remove(value):
#	get_node("slide/slide_area").set_visible(true)
#	drag_to_left = true
#	drag_to_right = false
	


#func _on_slide_area_area_entered(area):
#	print(area.name)
#	if(area.name == "slide_area"):
#		var position = Vector3(0, 0.48, 1.2)
##		to_default = false
#		set_translation(position)	

#
#func _on_Global_slide_enter(value):
#	if(value == 1):
#		var position = Vector3(0, 0.48, 1.2)
#		set_translation(position)	
##		yield(get_tree().create_timer(2), "timeout") 
#		to_default = false
#		mag_area.set_visible(true)
#		emit_signal("send_instruction", 6)
#		set_process(false)


func _on_colt_slide_area_area_entered(area):
	print(area.name + "for debugging")


#func _on_colt_slide_area_mouse_entered():
#	hovered = get_node(".")
#
#func _on_colt_slide_area_input_event(camera, event, position, normal, shape_idx):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT or event is InputEventScreenTouch:
#		if event.is_pressed():
#			if hovered:
#				set_process(true)
#		else:
#			set_process(false)
