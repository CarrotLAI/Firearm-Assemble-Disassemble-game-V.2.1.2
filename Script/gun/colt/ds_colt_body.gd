extends Spatial

var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var time_click = 0
var isDrag = true
var nextPost
var obj

func _ready():
	set_process(false)

signal send_descript(val)

func _on_slide_lock_mouse_entered():
	hovered = get_node("slide_lock_spatial")

func _on_Draggable_drag_move(node, cast):
	if isDrag:
		var	trigger = get_node("slide_lock_spatial")
		var x = cast.position.x-5
		var y = cast.position.y -5
		var z = -cast.position.x
		nextPost = Vector3(0, y, z)
		trigger.set_translation(nextPost)
#
#func _on_Draggable_drag_stop(node):
#	obj.set_translation(nextPost)


func _on_Area_area_entered(area):
	if area.name == "slide_lock_area":
		var	trigger = get_node("slide_lock_spatial")
		nextPost = Vector3(0, 0, 0)
		trigger.set_translation(nextPost)
		isDrag = false
		emit_signal("send_descript", 8)
	
