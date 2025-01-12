extends Spatial


# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var time_click = 0

var trigger_lock = true
var isClick = true

# Called when the node enters the scene tree for the first time.
onready var grip_area = $"%grip_area"

func _ready():
	set_process(false)

func _on_Draggable_drag_move(node, cast):
	if trigger_lock == false:
		x = cast.position.x - 4
		y = cast.position.y
		z = get_node(".").transform.origin.z
		nextPos = Vector3(x, y-3, z)
		print(cast.position)
		set_translation(nextPos)
	
onready var lock_area = $"%lock_area"

func _process(delta):
	var trigger = hovered
#	var rotation = trigger.rotation_degrees
	if Input.is_action_just_pressed("click") or Input.is_action_just_pressed("ui_touch"):
		if trigger_lock == true:
			var x = 9
			var y = 0
			var z = -8
			var next_position = Vector3(x, y, z)
			trigger.set_translation(next_position)
			trigger.rotation_degrees = Vector3(0, 40, 0)
			grip_area.set_visible(true)
			lock_area.set_visible(false)
			trigger_lock = false
			emit_signal("send_instruction", 5)
		
#	if Input.is_action_just_released("click"):
#		trigger = Vector3()
#		emit_signal("send_instruction", 5)


func _on_lock_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			if hovered:
				set_process(true)
		else:
			set_process(false)

func _on_lock_mouse_entered():
	hovered = get_node("Selector_Lever001_mesh_199_mesh_199001")
