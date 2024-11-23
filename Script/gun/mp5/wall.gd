extends Spatial

signal drag_pos(cast, val)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var drag

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("click"):
		drag = true
	if Input.is_action_just_released("click"):
		drag = false


func _on_StaticBody_input_event(camera, event, position, normal, shape_idx):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
	if drag:
		emit_signal("drag_pos", position, true)
	if !drag:
		emit_signal("drag_pos", position, false)
		
#		if event.is_pressed():
#			if hovered:
#				set_process(true)
#		else:
#			set_process(false)
