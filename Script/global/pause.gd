extends Control


var address = load("res://Scene/UI/game_index.tscn")
var back_to_menu = address.instance()
var new_pause_state

#func _ready():
#	var nodePause = get_tree().paused
#	nodePause.set_visible(false)

func _on_Resume_pressed():
	 _on_Button_pressed()

func _on_Quit_pressed():
	get_tree().change_scene_to(back_to_menu)
#	yield(get_tree().create_timer(1), "timeout")


func _on_Button_pressed():
	new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

