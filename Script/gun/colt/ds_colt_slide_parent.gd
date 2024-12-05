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

#
#func _on_spring_area2_area_exited(area):
#	if area.name == "spring_skeleton_area":
#		print_debug(area)
#		emit_signal("spring_skeleton_area", 1)
#
#
#func _on_barrel_area_area_exited(area):
#	if(area.name == "colt_barrel_area"):
#		print_debug(area)
#		emit_signal("colt_barrel_area", 1)

onready var spring_area = $colt_barrel_cap/spring_skeleton/spring/spring_area
onready var spring_area_condition = $spring_area

func _on_spring_area_area_entered(area):
	if area.name == "spring_skeleton_area":
		spring_area.set_visible(false)		
		print_debug(area)
		emit_signal("spring_skeleton_area", 1)
		spring_area_condition.set_visible(false)
		spring_area_condition.disconnect("area_entered", self, "_on_spring_area_area_entered")
		
onready var colt_barrel_area = $colt_barrel/mesh_158001/colt_barrel_area
onready var barrel_area = $barrel_area
onready var colt_barrel = $"%colt_barrel"

#func _on_barrel_area_area_entered(area):
#	if area.name == "colt_barrel_area":
#		colt_barrel_area.set_visible(false)
#		print_debug(area)
#		var position = Vector3(0, 0, 0)
#		colt_barrel.set_translation(position)
#		emit_signal("colt_barrel_area", 1)
#		barrel_area.set_visible(false)
#		barrel_area.disconnect("area_entered", self, "_on_barrel_area_area_entered")
