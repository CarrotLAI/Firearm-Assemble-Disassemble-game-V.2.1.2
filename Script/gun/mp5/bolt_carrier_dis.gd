extends Spatial

signal assemble_firingPin(val)
signal assemble_bolt(val)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x
var y
var z
var i = 10
var nextPos = Vector3()

var phaseOne = true
var phaseTwo = false

onready var firing_pin = $"%Firing_Pin"
onready var body_frame = $"%body_frame"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	if phaseOne:
		PhaseOne(node, cast)
	if phaseTwo:
		PhaseTwo(node, cast)

func PhaseOne(node, cast):
	body_frame.set_visible(false)
	x = cast.position.x - 20
	y = cast.position.y - 10
	z = cast.position.z
	nextPos = Vector3(-x, y, 0)
#	print(nextPos)
	set_translation(nextPos)
	if x > 5:
		phaseOne = false
		phaseTwo = true

func PhaseTwo(node, cast):
	x = cast.position.x
	y = cast.position.y - i
	z = cast.position.z
	nextPos = Vector3(-x, y, 0)
	if cast.position.y > y:
		i -= i
	set_translation(nextPos)
	

func _on_Draggable_drag_stop(node):
	set_translation(nextPos)


#firing pin
var firing_move = true
#bolt
func _on_bolt_carrier_area_area_entered(area):
#	print(area.name)
	if area.name == "firing_pin_Area":
		firing_move = false
		emit_signal("assemble_firingPin", true)
		nextPos = Vector3(8.878, 0, 0)
		firing_pin.set_translation(nextPos)
	

func _on_firing_pin_Draggable_drag_move(node, cast):
	if firing_move == true:
		x = cast.position.x
		y = cast.position.y
		z = cast.position.z
		nextPos = Vector3(-x, 0, 0)
		firing_pin.set_translation(nextPos)
	

#bolt carrier
var move_bolt = true
onready var locking_piece = $"%locking_piece"

func _on_bolt_carrier_Draggable_drag_move(node, cast):
	if move_bolt:
		x = cast.position.x
		y = cast.position.y - 15
		z = cast.position.z
		nextPos = Vector3(-x, 0, 0)
		locking_piece.set_translation(nextPos)
	
func _on_bolt_area_area_entered(area):
#	print(area.name)
	if area.name == "bolt_carrier_Area":
		move_bolt = false
		emit_signal("assemble_bolt", true)
		nextPos = Vector3(6.461, 0, 0)
		locking_piece.set_translation(nextPos)
		

#bolt head
var move_boltHead = true
var inc = 0.4
onready var holder_pin = $"%holder_pin"
onready var bolt_head = $"%bolt_head"

func _on_bolt_head_Draggable_drag_move(node, cast):
	if move_boltHead:
		x = (cast.position.x + 16.344) + (cast.position.x + 7)
		y = cast.position.y - 15
		z = cast.position.z
		nextPos = Vector3(-x, 0, 0)
#		bolt_head.set_translation(nextPos)
		holder_pin.set_translation(nextPos)
		

func _on_bolt_main_Area_area_entered(area):
#	print(area.name)	
	if area.name == "bolt_carrier_Area" || area.name =="firing_pin_Area" || area.name == "bolt_carrier_Area":
		move_boltHead = false
		emit_signal("assemble_bolt", true)
		nextPos = Vector3(-34.838, 0.8, 0)
		holder_pin.set_translation(nextPos)

#bolt main
#var move_bolrMain = true



func _on_bolt_carrier_area_entered(area):
	if area.name == "Bolt_Carrier_mesh_Area" || area.name == "bolt_carrier_Area" || area.name =="firing_pin_Area" || area.name == "bolt_carrier_Area":
		x = 18.456
		y = -3.089
		nextPos = Vector3(-x, y, 0)
#		bolt_head.set_translation(nextPos)
		set_translation(nextPos)
	
