extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var game_index = preload("res://Scene/UI/game_index.tscn")

func _on_Button_pressed():
		get_tree().change_scene_to(game_index)
#		yield(get_tree().create_timer(1), "timeout")  # Correct syntax for a delay
