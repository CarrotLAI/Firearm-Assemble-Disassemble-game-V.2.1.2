extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var game_index = preload("res://Scene/UI/game_index.tscn")
onready var video_player = $VideoPlayer

func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	video_player.use_hw_decoder = true
	video_player.stream = preload("res://Video/new_glock.webm")
	video_player.play()
	
func _on_Button_pressed():
		get_tree().change_scene_to(game_index)
#		yield(get_tree().create_timer(1), "timeout")  # Correct syntax for a delay


func _on_VideoPlayer_finished():
	video_player.play()
