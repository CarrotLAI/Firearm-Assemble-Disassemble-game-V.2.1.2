extends Spatial


#signals
signal slide_condition(value)

# Declare member variables here. Examples:
#var x 
#var y 
#var z
#var nextPos = Vector3()

var drag_to_right = true
var drag_to_left = false
var isSlide = false
var isSlide_for_lock = false
# Called when the node enters the scene tree for the first time.
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
#	
	
#	if(isSlide_for_lock):
#		var position = Vector3(x, 0.5, z)
#		set_translation(position)
#
func Drag_to_right(node, cast):
	var x = cast.position.x
	var y = cast.position.y - 3.5
	var z = get_node(".").transform.origin.z
#	var slide = get_node(".")
	if(x <= 1.2 && x >= 0):
		var nextPos = Vector3(x, 0.5, z)
		print(cast.position.x)
		set_translation(nextPos)
	if(x > 1):
		To_default_position(node, cast)
	
func To_default_position(node, cast):
#	set_Drag_to_right(false)
#	if(drag_to_right == false):
	get_node("slide/slide_area").set_visible(false)
	_on_Draggable_drag_stop(node)
#		isSlide = false
	drag_to_right = false
#		

#remove slide
func Drag_to_left(node, cast):
	var x = cast.position.x
	var y = cast.position.y - 3.5
	var z = get_node(".").transform.origin.z
#	var slide = get_node(".")
	if(x <= 0 && x >= -1):
		var nextPos = Vector3(x, 0.5, z)
		print(cast.position.x)
		set_translation(nextPos)
	if(x == -1):
		pass
		Remove_from_body(node, cast)
#		To_default_position(node, cast)

func Remove_from_body(node, cast):
	var x = cast.position.x
	var y = cast.position.y - 3.5
	var z = get_node(".").transform.origin.z
	var nextPos = Vector3(x, y, z)
	set_translation(nextPos)

func spring_remove(value):
	if (value):
		isSlide_for_lock = value


func _on_Draggable_drag_stop(node):
	print_debug(get_node('.'))
#	var slide = slide
#	if(isSlide == true):
	var defaulPos = Vector3(0, 0.5, 1.2)
	set_translation(defaulPos)


func _on_spring_cap_spring_remove(value):
	get_node("slide/slide_area").set_visible(true)
	drag_to_left = true;
	
