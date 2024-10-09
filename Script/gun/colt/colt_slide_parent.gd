extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal colt_barrel_area(value)
signal spring_skeleton_area(value)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_colt_slide_move_parent(value):
	pass # Replace with function body.


func _on_spring_area2_area_exited(area):
	if area.name == "spring_skeleton_area":
		print_debug(area)
		emit_signal("spring_skeleton_area", 1)


func _on_barrel_area_area_exited(area):
	if(area.name == "colt_barrel_area"):
		print_debug(area)
		emit_signal("colt_barrel_area", 1)
