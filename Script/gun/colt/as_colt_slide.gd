extends Spatial


#signals
signal slide_condition(value)
signal move_parent(value)
signal send_instruction(val)
# Declare member variables here. Examples:
#var x 
#var y 
#var z
#var nextPos = Vector3()

var to_default = true
var drag_to_left = false
var remove_to_body = false
var isSlide = false
var isSlide_for_lock = false
# Called when the node enters the scene tree for the first time.

onready var spring_cap = $"%spring_cap"
onready var cylinder_cap = $"%cylinder_cap"
onready var colt_barrel = $"%colt_barrel"
onready var colt_barrel_cap = $"%colt_barrel_cap"
onready var colt_slide_parent = $"%colt_slide_parent"
onready var mag_area = $"%mag_area"


func _ready():
	pass # Replace with function body.



func _on_Draggable_drag_move(node, cast):
	if(to_default):
		drag_to_default(node, cast)
#	else:
#		print(to_default)
#
func drag_to_default(node, cast):
	var x = cast.position.x + 2
	var y = cast.position.y - 4
	var z = get_node(".").transform.origin.z
	var nextPos = Vector3(x, y, 1.2)
	colt_slide_parent.set_translation(nextPos)
	if to_default:
		set_process(false)
	
func spring_remove(value):
	if (value):
		isSlide_for_lock = value
	
func _on_Draggable_drag_stop(node):
	pass
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


func _on_Global_slide_enter(value):
	if(value == 1):
		var position = Vector3(0, 0.48, 1.2)
		set_translation(position)	
		to_default = false
		mag_area.set_visible(true)
		emit_signal("send_instruction", 6)
		set_process(false)
