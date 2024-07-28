extends Spatial

onready var magazine = $"%magazine"
var isMagazine_enter = false

var x
var y
var z

func _on_draggable_mag_drag_move(node, cast):
	x = cast.position.x
	y = 0.5
	z = cast.position.z
	var to_position = Vector3(x, y, z)
	set_translation(to_position)

func _on_draggable_mag_drag_stop(node):
	var area_lock = magazine
	if isMagazine_enter:
		var in_position = Vector3(1.676, 0.5, 1.258)
		area_lock.set_translation(in_position)

#from global node with assemble_condition script
func _on_Global_area_lock(value):
	isMagazine_enter = value
	print(isMagazine_enter)
