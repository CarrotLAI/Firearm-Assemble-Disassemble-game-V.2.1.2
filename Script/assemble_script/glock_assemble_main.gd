extends Spatial


signal start_game(value)

func _ready():
	emit_signal("start_game", true)
