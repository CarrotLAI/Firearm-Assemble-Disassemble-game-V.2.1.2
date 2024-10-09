extends Spatial


# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var isremove_barrel = true
var is_barrel_outside = false
var isReady_Barrel_outside = false
var game_win

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Draggable_drag_move(node, cast):
	if (isremove_barrel):
		Remove_barrel(node, cast)
	if(is_barrel_outside):
		Barrel_outside(node, cast)
		
func Remove_barrel(node, cast):
#	print_debug("click")
	x =  get_node(".").transform.origin.z
	y =  cast.position.y - 7.5
	z = -(cast.position.x) - 3
	nextPos = Vector3(0, y, z)
	set_translation(nextPos)
	if(game_win == 1):
		isremove_barrel = false
		set_process(false)
#	add signal here
	
#	x =  get_node(".").transform.origin.z
#	y = -(cast.position.y - 7)
#	z = -(cast.position.x)
#	nextPos = Vector3(0, -2.5, -2)
#	set_translation(nextPos)
#	isReady_Barrel_outside = true
	
#	if(isReady_Barrel_outside):
#		print_debug(z)
#		isremove_barrel = false
#		is_barrel_outside = true
		
func Barrel_outside(node, cast):
	pass


func _on_colt_slide_parent_colt_barrel_area(value):
	game_win = value
