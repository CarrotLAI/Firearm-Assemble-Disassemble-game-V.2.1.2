extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var game_index = load("res://Scene/UI/game_index.tscn")

onready var colt = $colt
onready var glock = $glock
onready var mp_5 = $mp5

var enumDescript

func _ready():
	pass
#	

func _on_Button_pressed():
		get_tree().change_scene_to(game_index)
		yield(get_tree().create_timer(1), "timeout")  # Correct syntax for a delay


func _on_menu_buttons_EnumDescript(val):
	if val == 1: #glock
		glock.set_visible(false)
		colt.set_visible(false)
		mp_5.set_visible(false)
	if val == 2: #colt
		colt.set_visible(true)
		glock.set_visible(false)
		mp_5.set_visible(false)
	if val == 2: #mp5
		mp_5.set_visible(true)
		colt.set_visible(false)
		glock.set_visible(false)
#	glock.set_visible(true)
#	colt.set_visible(false)
#	mp_5.set_visible(false)
