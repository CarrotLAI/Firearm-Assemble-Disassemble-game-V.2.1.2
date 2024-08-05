extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_start_pressed():
	print("start")
	get_node("start").move(Vector2(-700, 0))
	get_node("Category").move(Vector2(0,0))
#	get_node("guns").move(Vector2(0, 0))

func _on_back_pressed():
	get_node("guns").move(Vector2(700, 0))
	get_node("Category").move(Vector2(0, 0))
	
#func _on_disassemble_pressed():
#	get_node("modes").move(Vector2())
func proceed_glock(e):
	print("true")
	
func _on_game_interface_proceed_glock(val):
	get_node("guns").move(Vector2(700,0))
	get_node("modes").move(Vector2(0,0))
	
#func _on_glock_pressed():
	


func _on_back_to_difficulty_pressed():
	get_node("modes").move(Vector2(700,0))
	get_node("guns").move(Vector2(0,0))


func _on_Pistol_pressed():
	get_node("Category").move(Vector2(700,0))
	get_node("guns").move(Vector2(0, 0))


func _on_Back_pressed():
	get_node("start").move(Vector2(0, 0))
	get_node("Category").move(Vector2(700,0))


func _on_video_tutorial_pressed():
	pass # Replace with function body.

