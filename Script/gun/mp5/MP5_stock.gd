extends Spatial

signal remove_stock(val)

# Declare member variables here. Examples:
var x 
var y 
var z
var nextPos = Vector3()

var isRemoveStock = true

onready var body_frame = $"%body_frame"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Draggable_drag_move(node, cast):
	if isRemoveStock:
		PhaseOne(node, cast)

#	if get_node(".").transform.origin.x > 4:
#		RemoveStock(node, cast)

func PhaseOne(node, cast):
	x = cast.position.x - 6
	y = cast.position.y - 6
	z = get_node(".").transform.origin.z
	nextPos = Vector3(x, y, z)
	set_translation(nextPos)

func RemoveStock(node, cast):
	body_frame.set_visible(false)
#	frame1.set_visible(false)
#	frame2.set_visible(false)
	emit_signal("remove_stock", true)
