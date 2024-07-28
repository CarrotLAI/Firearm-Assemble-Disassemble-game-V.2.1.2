extends Spatial

export (float) var ray_length = 100

var draggables = []
var camera: Camera
var draging #node
var drag_offset = Vector3()
var obj
var obj_position
var cast_position
var speed = 20
var of = Vector2()
var is_clicked = false

func _ready():
	set_physics_process(false)

func _input(event):
	camera = get_tree().get_root().get_camera()
	if camera == Camera:
		_input(false)
	
func register_draggable(node):
	draggables.append(node)
	node.connect("drag_start",self,"_drag_start")
	node.connect("drag_stop",self,"_drag_stop")
	
func _drag_start(node):
	draging = node
	is_clicked = true
	set_physics_process(true)
	
func _drag_stop(node):
	is_clicked = false
	set_physics_process(false)

#raycast mouse
func _physics_process(delta):
	var mouse = get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse)
	var to = from + camera.project_ray_normal(mouse) * ray_length
	var cast = camera.get_world().direct_space_state.intersect_ray(from, 
				to, [draging.get_parent()], draging.get_parent().get_collision_mask(), true, true)
	if cast:
#		of =- mouse
#		position = get_global_position() - of
		obj = draging.get_parent().get_parent().get_parent()
		obj_position = obj.transform.origin
		cast_position = Vector3(cast.position.x, obj_position.y, cast.position.z)
		drag_offset = lerp(obj_position, cast_position, speed * delta)
		var dict = {
			"clicked" : is_clicked,
			"offset" : {
				"x": drag_offset.x,
				"y": drag_offset.y,
				"z": drag_offset.z
				},
			"drag_offset": drag_offset,
			"cast" : cast_position,
			"obj_position" : {
				"x" : obj_position.x,
				"y" : obj_position.y,
				"z" : obj_position.z
			}
		}
#		print(drag_offset)
#		print_debug(cast.position)
		draging.on_hover(cast)
	return Vector3()
#	if not cast.empty():
#		draging.on_hover(cast)
