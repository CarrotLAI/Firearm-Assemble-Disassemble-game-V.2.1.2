extends Spatial


# Declare member variables here. Examples:
var x; var y; var z
var nextPos = Vector3()
var isDrag = false
var dragging = false
var remove_grip = true

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var time_click = 0

onready var mp5_lock = $MP5_lock
onready var body_frame = $"%body_frame"

onready var stock_area = $"%stock_area"

func _ready():
	set_process(false)


#func _on_Draggable_drag_stop(node):
#	set_translation(nextPos)

func _on_Draggable_drag_move(node, cast):
	if isDrag:
		dragNode(node, cast)

func _process(delta):
	if Input.is_action_just_pressed("click"):
		if remove_grip:
			ToPosition(hovered)
#		prev_mousePos = get_viewport().get_mouse_position()
#	if Input.is_action_just_released("click"):
#		set_translation(nextPos)

#	if rotating:
#		next_mousePos = get_viewport().get_mouse_position()
#		trigger.rotate_z(-(next_mousePos.y - prev_mousePos.y) * .4 * delta)
#		prev_mousePos = next_mousePos

func ToPosition(trigger):
	trigger = hovered
	var x = -0.059
	var y = 3.983
	var z = 1.2
#	prev_mousePos = get_viewport().get_mouse_position()
	var next_position = Vector3(x, y, z)
	if trigger:
		trigger.set_translation(next_position)
		trigger.rotation_degrees = Vector3(0, -180, 25)
		isDrag = true;
		remove_grip = false
		stock_area.set_visible(true)
		

func  dragNode(node, cast):
	x = cast.position.x - 4
	y = cast.position.y
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y-3, z)
#	print(cast.position)
	set_translation(nextPos)

#func _on_lock_mouse_entered():
#	hovered = mp5_lock.get_node("Selector_Lever001_mesh_199_mesh_199001")
#	print(hovered)


func _on_Area_mouse_entered():
	hovered = get_node(".")
#	print_debug(hovered)


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			if hovered:
				set_process(true)
		else:
			set_process(false)

