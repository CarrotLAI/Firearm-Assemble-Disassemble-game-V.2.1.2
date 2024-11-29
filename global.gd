extends Node

func _ready():
	SilentWolf.configure({
	"api_key": "0cO9IGqn2T5AriYPTbWHy57z2iHCLPHY7ZLznkKg",
	"game_id": "firearmsimulator",
	"game_version": "1.0.2",
	"log_level": 1
	})
	SilentWolf.configure_scores({
	"open_scene_on_close": "res://Scene/UI/game_index.tscn"
	})
