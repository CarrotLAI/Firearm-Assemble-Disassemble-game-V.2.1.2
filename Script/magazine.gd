extends Spatial

#onready var imported_collided = get_node('../gun/RayCast').get("collided")
onready var magazine = $"%magazine"

func _on_draggable_mag_drag_move(node, cast):
#	print(imported_collided)
	var positionX = cast.position.x
	var positionZ = cast.position.z 
	var mag_pos = magazine.transform.origin
#	var offset = mag_pos - cast.position
#	transform.translated(offset)
#	var offset = -(mag_pos - cast.position) * .3 + cast.position
#	print(mag_pos)
#	var position = Vector3(offset.x, mag_pos.y ,offset.z)
	var newPos = Vector3(positionX, mag_pos.y, positionZ)
	set_translation(newPos)


func _on_Area_area_entered(area):
	print(area)


func _on_Area_body_entered(body):
	print(body)
