extends Spatial


# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var ismove_barrel = true
var is_barrel_outside = false
var isReady_Barrel_outside = false
var game_win

signal send_instruction(val)

onready var cylinder_cap_area = $"%cylinder_cap_area"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Draggable_drag_move(node, cast):
	if (ismove_barrel):
		Move_barrel(node, cast)
		
	if(is_barrel_outside):
		Barrel_outside(node, cast)
		
func Move_barrel(node, cast):
#	print_debug("click")
	x =  get_node(".").transform.origin.z
	y =  cast.position.y - 7
	z = -(cast.position.x) - 7
	nextPos = Vector3(0, y, z)
	set_translation(nextPos)
#	if(game_win == 1):
#		isremove_barrel = false
#		set_process(false)
#	add signal here
		
func Barrel_outside(node, cast):
	pass

#func _on_colt_slide_parent_colt_barrel_area(value):
##	game_win = value
#	if(value == 1):
#		var position = Vector3(0, 0, -0.2)
#		set_translation(position)
#		get_node("mesh_158001/colt_barrel_area").set_visible(false)
#		ismove_barrel = false		
#		cylinder_cap_area.set_visible(true)
#		emit_signal("send_instruction", 2)
#		set_process(false)



func _on_barrel_area_area_entered(area):
	if area.name == "colt_barrel_area":
		print_debug(area.name)
		print_debug("testtt")
		ismove_barrel = false
#		emit_signal("assemble_bolt", true)
		nextPos = Vector3(0, 0, -0.2)
		set_translation(nextPos)
		get_node("mesh_158001/colt_barrel_area").set_visible(false)
		cylinder_cap_area.set_visible(true)
		emit_signal("send_instruction", true)
#		set_process(false)
