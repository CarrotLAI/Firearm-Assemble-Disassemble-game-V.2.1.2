extends Area


var previous_mouse_position = Vector3()
var is_drag = false
var position
#
#func _on_input_event(camera, event, position, normal, shape_idx):
#	##Allow dragging if the user clicks inside  the collision shape
#	if event.is_action_pressed("ui_touch"):
#		print(event)
#		get_tree().set_input_as_handled()
#		previous_mouse_position = event.position
#		is_drag = true
#
#func _input(event):
#	##Works globlally so dragging works if mouse cursor is outside of Collision Shape 
#	##Disables dragging if the user releases click
#	if not is_drag:
#		return
#
#	if event.is_action_release("ui_touch"):
#		previous_mouse_position = Vector3()
#		is_drag = false
#
#	if is_drag and event is InputEventMouseMotion:
#		position += event.position - previous_mouse_position
#		previous_mouse_position = event. position
func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("click")
				var mouse_position = get_viewport().get_mouse_position()
				var camera = get_viewport().get_camera()
				var from = camera.project_ray_origin(mouse_position)
				var to = from + camera.project_ray_normal(mouse_position) * 1000
				var space_state = get_world().direct_space_state
				var result = space_state.intersect_ray(from, to)
				if result:
					if result.collider == self:
						is_drag = true
						return
			elif !event.pressed:
				print(is_drag)
				is_drag = false

func _process(delta):
	if is_drag:
		var mouse_motion = get_viewport().get_mouse_motion()
		var camera = get_viewport().get_camera()
		var right = camera.global_transform.basis.x
		var up = camera.global_transform.basis.y
		var translation = right * -mouse_motion.x + up * mouse_motion.y
		translation = translation * 0.01
		translation.y = 0  # Lock movement on the Y axis
		translate(translation)
