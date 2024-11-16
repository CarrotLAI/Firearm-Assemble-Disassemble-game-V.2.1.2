extends Spatial

signal remove_stock(val)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

onready var frame1 = $"%Inner_Frame_mesh_33_mesh_33003"
onready var frame2 = $"%Frame001_mesh_212_mesh_212003"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Draggable_drag_move(node, cast):
	x = cast.position.x - 6
	y = cast.position.y - 6
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y, z)
#	print(cast.position)
	set_translation(nextPos)
#	if get_node(".").transform.origin.x > 4:
#		RemoveStock(node, cast)

func PhaseOne(node, cast):
	set_translation(nextPos)

func RemoveStock(node, cast):
	frame1.set_visible(false)
	frame2.set_visible(false)
	emit_signal("remove_stock", true)
	pass
