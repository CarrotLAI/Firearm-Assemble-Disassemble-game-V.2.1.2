extends Node

#global var for data
var player_name = "Player"
var player_score = 0
var EnumsDescript = 0

func _ready():
	print("Initialized global")
	SilentWolf.configure({
	"api_key": "0cO9IGqn2T5AriYPTbWHy57z2iHCLPHY7ZLznkKg",
	"game_id": "firearmsimulator",
	"game_version": "1.0.2",
	"log_level": 1
	})
	SilentWolf.configure_scores({
	"open_scene_on_close": "res://Scene/UI/game_index.tscn"
	})

func _setPlayerName(val):
	player_name = val

func _getPlayerName():
	return player_name

func _setEnumsDescript(val):
	EnumsDescript = val

func _getEnumsDescript():
	return EnumsDescript
