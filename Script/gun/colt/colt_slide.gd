extends Spatial


#signals
signal slide_condition(value)
signal move_parent(value)
# Declare member variables here. Examples:
#var x 
#var y 
#var z
#var nextPos = Vector3()

var drag_to_right = true
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


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	
	if(drag_to_right):
		Drag_to_right(node, cast)
	
	if(drag_to_left):
		Drag_to_left(node, cast)
		
	if(remove_to_body):
		Remove_from_body(node, cast)
	
#	if(isSlide_for_lock):
#		var position = Vector3(x, 0.5, z)
#		set_translation(position)
#
func Drag_to_right(node, cast):
	var x = get_node(".").transform.origin.z
	var y = cast.position.y - 3.5
	var z = -(cast.position.x)
#	var slide = get_node(".")
	if(z <= 1.2 && x >= z):
		var nextPos = Vector3(0, 0, z)
		print_debug(nextPos)
#		print(cast.position)
		set_translation(nextPos)
		spring_cap.set_translation(nextPos)
		cylinder_cap.set_translation(nextPos)
	if(z  <= -3.6):
		print_debug("Drag_to_right")
		To_default_position(node, cast)
	
func To_default_position(node, cast):
#	set_Drag_to_right(false)
	print_debug("Check point To_default_position")
	var defaulPos = Vector3(0, 0, 0)
	set_translation(defaulPos)
	spring_cap.set_translation(defaulPos)
	cylinder_cap.set_translation(defaulPos)
	get_node("slide/slide_area").set_visible(false)
	drag_to_right = false
	_on_Draggable_drag_stop(node)
#		isSlide = false
#		

#remove slide
func Drag_to_left(node, cast):
	print_debug("Drag_to_left")
	var x = get_node(".").transform.origin.z
	var y = cast.position.y - 3.5
	var z =  -(cast.position.x)
#	var slide = get_node(".")
	if(x <= 0 && x >= -1.2):
		var nextPos = Vector3(0, 0, z)
#		print(nextPos)
		set_translation(nextPos)
		spring_cap.set_translation(nextPos)
		cylinder_cap.set_translation(nextPos)
	if(z >= 4):		
		drag_to_left = false
		remove_to_body = true
#		send signal to parent slide
#		Move_slide(node, cast)
#		emit_signal("move_parent", true)
		
#		To_default_position(node, cast)

func Remove_from_body(node, cast):
	print_debug("Remove_from_body")
	var x = cast.position.x
	var y = cast.position.y - 4
	var z = get_node(".").transform.origin.z
	var nextPos = Vector3(x, y, z)
	colt_slide_parent.set_translation(nextPos)
#	spring_cap.set_translation(nextPos)
#	colt_barrel.set_translation(nextPos)
#	cylinder_cap.set_translation(nextPos)
#	colt_barrel_cap.set_translation(nextPos)
	

func spring_remove(value):
	if (value):
		isSlide_for_lock = value
	
	
func _on_Draggable_drag_stop(node):
	pass
#	print_debug(get_node('.'))
#	var slide = slide
#	if(isSlide == true):

func _on_spring_cap_spring_remove(value):
	get_node("slide/slide_area").set_visible(true)
	drag_to_left = true
	drag_to_right = false
	
