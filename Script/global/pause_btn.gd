extends Sprite


signal pause_game()

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event.is_action_pressed("click"):
		emit_signal("pause_game")
	
