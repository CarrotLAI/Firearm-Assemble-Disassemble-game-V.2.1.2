extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal colt_barrel_area(value)
signal spring_skeleton_area(value)
signal send_instruction(val)

func _on_spring_area2_area_exited(area):
	if area.name == "spring_skeleton_area":
		print_debug(area)
		emit_signal("spring_skeleton_area", 1)


func _on_barrel_area_area_exited(area):
	if(area.name == "colt_barrel_area"):
		print_debug(area)
		emit_signal("colt_barrel_area", 1)

#Slide
var drag_to_right = true
var drag_to_left = false
var remove_to_body = false
var isSlide = false
var isSlide_for_lock = false
onready var spring_cap = $"%spring_cap"
onready var cylinder_cap = $"%cylinder_cap"
onready var colt_barrel = $"%colt_barrel"
onready var colt_barrel_cap = $"%colt_barrel_cap"
onready var colt_slide_parent = $"%colt_slide_parent"
onready var slide = $"%slide"
onready var colt_slide = $"%colt_slide"
onready var spring_skeleton = $"%spring_skeleton"

#array
var slide_node = [colt_slide, spring_cap, cylinder_cap, spring_skeleton]

#region Slide
func _on_Slide_Draggable_drag_move(node, cast):
	if(drag_to_right):
		Drag_to_right(node, cast)

	if(drag_to_left):
		Drag_to_left(node, cast)
	if (isRemove_spring_cap):
		drag_to_left = true
		drag_to_right = false
	if(remove_to_body):
		Remove_from_body(node, cast)
#	Remove_from_body(node, cast)
	
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
#		print(nextPos)
		var nextPos = Vector3(0, 0, z)
		colt_slide.set_translation(nextPos)
		spring_cap.set_visible(false)
		cylinder_cap.set_visible(false)
		spring_skeleton.set_visible(false)
		
	if(z  <= -3.6):
#		print_debug("Drag_to_right")
		emit_signal("send_instruction", 3)
		To_default_position(node, cast)
	
func To_default_position(node, cast):
#	set_Drag_to_right(false)
	print_debug("Check point To_default_position")
	var defaulPos = Vector3(0, 0, 0)
	colt_slide.set_translation(defaulPos)
#	spring_cap.set_translation(defaulPos)
#	cylinder_cap.set_translation(defaulPos)
#	colt_slide.set_translation(nextPos)	
#	spring_skeleton.set_translation(nextPos)
	slide.get_node("slide_area").set_visible(false)
	spring_cap.get_node("spring/spring_cap_area").set_visible(true)
	spring_cap.set_visible(true)
	cylinder_cap.set_visible(true)
	spring_skeleton.set_visible(true)
	drag_to_right = false
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
#		spring_cap.set_translation(nextPos)
#		cylinder_cap.set_translation(nextPos)
	if(z >= 4):		
		drag_to_left = false
		remove_to_body = true
#		send signal to parent slide
#		Move_slide(node, cast)
#		emit_signal("move_parent", true)
#		To_default_position(node, cast)

func Remove_from_body(node, cast):
	var x = cast.position.x + 2
	var y = cast.position.y - 3.5
	var z = get_node(".").transform.origin.z
	var nextPos = Vector3(x, y, 0)
	emit_signal("send_instruction", 6)
	set_translation(nextPos)
#	spring_cap.set_translation(nextPos)
#	colt_barrel.set_translation(nextPos)
#	cylinder_cap.set_translation(nextPos)
#	colt_barrel_cap.set_translation(nextPos)
	
func spring_remove(value):
	if (value):
		isSlide_for_lock = value

func _on_spring_cap_spring_remove(value):
	pass
	
#endregion Slide

#region spring
var nextPos = Vector3()
var isRemove_spring_cap = false

#conditions
var drag_to_outside = true
#spring cap
func _on_Draggable_drag_move(node, cast):
	if(drag_to_outside):
		Drag_outside(node, cast)
		
#change it to onclick
func Drag_outside(node, cast):
#	var spring_cap = get_node(".")
	var x = spring_cap.transform.origin.x
	var y = cast.position.y - 3.2
	var z = -(cast.position.x)
#	if(z >= 0 && z <= 6.4):
	nextPos = Vector3(0, 0, 6)
#	print_debug(z)
	spring_cap.set_translation(nextPos)
	if(spring_cap.transform.origin.z >= 4):	
		Default_position(node, cast)
		drag_to_outside = false
		print(z)

func Default_position(node, cast):
	slide.get_node("slide_area").set_visible(true)
	print_debug("Default_position")
	var default_position = Vector3(0,0,6)
	spring_cap.set_translation(default_position)
	isRemove_spring_cap = true
	
#	emit_signal("spring_remove", true)

#%spring_skeleton main
var away_from_slide = false
var  remove_spring_skeleton = true
var isSlideActive = true

func _on_spring_Draggable_drag_move(node, cast):
	if(away_from_slide):
		Away_from_slide(node, cast)
		
	if(remove_spring_skeleton):
		Remove_Spr_Skel(node, cast)		
		
func Away_from_slide(node, cast):
	isSlideActive = false
	var x = get_node(".").transform.origin.z
	var y = -spring_skeleton.transform.origin.y * 20
	var z = -(cast.position.x * 50)
	spring_skeleton.set_translation(nextPos)
	
	
func Remove_Spr_Skel(node, cast):
	isSlideActive = false
	var x = get_node(".").transform.origin.z
	var y = spring_skeleton.transform.origin.y
	var z = -(cast.position.x * 50)
	if(z < -2):
		var nextPos = Vector3(0, 0, z)
		spring_skeleton.set_translation(nextPos)
	if(z >= -4):
		away_from_slide = true
		cylinder_cap.get_node("mesh_187002/cylinder_area").set_visible(true)

#end region
