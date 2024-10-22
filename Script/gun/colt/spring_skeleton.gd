extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var away_from_slide = false
var  remove_spring_skeleton = true


onready var colt_slide = $"%colt_slide"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Draggable_drag_move(node, cast):
	
	if(away_from_slide):
		pass
		
	if(remove_spring_skeleton):
		Remove_Spr_Skel(node, cast)		
		
		
func Remove_Spr_Skel(node, cast):
	var x = get_node(".").transform.origin.z
	var y = (cast.position.y - 7) * 4
	var z = -((cast.position.x + 3 )* 4)
	var nextPos = Vector3(0, y, z)
#	print(nextPos)
	set_translation(nextPos)
	colt_slide.get_node("slide/slide_area").set_visible(false)
		
	
	
