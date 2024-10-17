extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var away_from_slide = false
var  default_spring_skeleton = true


onready var colt_slide = $"%colt_slide"
onready var spring_cap_area = $"%spring_cap_area"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	if(default_spring_skeleton):
		default_Spr_Skel(node, cast)		
		
		
func default_Spr_Skel(node, cast):
	var x = get_node(".").transform.origin.z
	var y = cast.position.y - 7
	var z = -(cast.position.x) - 9
	var nextPos = Vector3(0, y, z)
#	print(nextPos)
	set_translation(nextPos)
#	colt_slide.get_node("slide/slide_area").set_visible(false)
		

func _on_spring_skeleton_area_area_entered(area):
	print(area.name)
	if(area.name == "spring_area"):
		var position = Vector3(0, 0, 0)
		set_translation(position)
#		get_node("mesh_136001/spring_skeleton_area").set_visible(false)
		set_process(false)
		
func _on_spring_area_area_entered(area):
	if(area.name == "spring_area"):
		var position = Vector3(0, 0, 0)
		set_translation(position)
		default_spring_skeleton = false
		spring_cap_area.set_visible(true)
		set_process(false)
		

func _on_colt_slide_parent_spring_skeleton_area(value):
	if(value == 1):
		var position = Vector3(0, 0, 0)
		set_translation(position)
		default_spring_skeleton = false
		spring_cap_area.set_visible(true)		
#		get_node("mesh_136001/spring_skeleton_area").set_visible(false)
		set_process(false)
