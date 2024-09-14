extends Spatial


#signals
signal spring_remove(value)

# Declare member variables here. Examples:
var x
var y
var z
var nextPos = Vector3()

#conditions
var drag_to_outside = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	
	if(drag_to_outside):
		Drag_outside(node, cast)
	
	
	
#change it to onclick
func Drag_outside(node, cast):
	
#	var spring_cap = get_node(".")
	var x = get_node(".").transform.origin.x
	var y = cast.position.y - 3.2
	var z = -(cast.position.x)
	if(z >= 0 && z <= 6.4):
		nextPos = Vector3(0, 0, z)
		print(z)
		set_translation(nextPos)
	if(z <= 6):
		print("lock")
		Default_position(node, cast)

func Default_position(node, cast):
#	get_parent().get_parent().get_node("slide/slide_area").set_visible(true)
	var default_position = Vector3(0,0,-6.2)
	set_translation(default_position)
	emit_signal("spring_remove", true)
	
