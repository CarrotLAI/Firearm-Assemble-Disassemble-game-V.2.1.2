extends Control

signal EnumDescript(val)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var control = $"../Control"

#modes node
onready var vbox_glock = $modes/vbox
onready var vbox_calibre = $modes/vbox_calibre
onready var vbox__m_16 = $modes/vbox_M16
onready var vbox_smg = $modes/vbox_Smg

onready var notify = $notify
onready var label = $notify/VBoxContainer/Label


func _on_start_pressed():
	print("start")
	get_node("start").move(Vector2(-700, 0))
	get_node("Category").move(Vector2(0,0))
#	get_node("guns").move(Vector2(0, 0))

func _on_back_pressed():
	control.set_visible(false)
#	control.get_node("ColorRect").set_visible(false)
#	control.get_node("RichTextLabel").set_visible(false)
	get_node("guns").move(Vector2(700, 0))
	get_node("Category").move(Vector2(0, 0))
	
#func _on_disassemble_pressed():
#	get_node("modes").move(Vector2())
#func proceed_glock(e):
#	print("true")

#########################
# on button event from guns groupd
#########################

func _on_game_interface_proceed_glock(val):
	var vbox_glock = get_node("modes/vbox")
	get_node("guns").move(Vector2(700,0))
	get_node("modes").move(Vector2(0,0))
	
func _on_game_interface_proceed_calibre(val):
	vbox_glock.set_visible(false)
	label.rect_position = Vector2(100, 200)
	vbox_calibre.set_visible(true)
	get_node("guns").move(Vector2(700,0))
	get_node("modes").move(Vector2(0,0))
	
	yield(get_tree().create_timer(1), "timeout")
#	notify.set_visible(true)


func _on_game_interface_proceed_smg(val):
	vbox_glock.set_visible(false)
	vbox_smg.set_visible(true)
	label.rect_position = Vector2(100, 200)
	get_node("smg").move(Vector2(700,0))
	get_node("modes").move(Vector2(0,0))

#########################
# END
#########################

func _on_back_to_difficulty_pressed():
	get_node("modes").move(Vector2(700,0))
	get_node("guns").move(Vector2(0,0))


func _on_Pistol_pressed():
	get_node("Category").move(Vector2(700,0))
	get_node("guns").move(Vector2(0, 0))


func _on_Back_pressed():
	get_node("start").move(Vector2(0, 0))
	get_node("Category").move(Vector2(700,0))

#glock
func _on_video_tutorial_pressed():
	var glock_video = load("res://Scene/Tutorials/glock.tscn")
	get_tree().change_scene_to(glock_video)
	yield(get_tree().create_timer(1), "timeout")
#	var youtube_url = "https://www.youtube.com/watch?v=I5IvD


func _on_back_to_mode_pressed():
	notify.set_visible(false)
	get_node("modes").move(Vector2(700,0))
	get_node("guns").move(Vector2(0,0))


func _on_smg_pressed():
	get_node("Category").move(Vector2(700,0))
	get_node("smg").move(Vector2(0, 0))

var leaderboard_screen = preload("res://addons/silent_wolf/Scores/Leaderboard.tscn")
func _on_leaderboard_pressed():
	get_tree().change_scene_to(leaderboard_screen)
	get_node("board").move(Vector2(0,0))
	get_node("start").move(Vector2(700,0))
	
func _on_ld_back_pressed():
	get_node("board").move(Vector2(0,-1225))
	get_node("start").move(Vector2(0,0))
	
func _on_mp5_back_pressed():
	get_node("Category").move(Vector2(0,0))
	get_node("smg").move(Vector2(700, 0))



func _on_colt_video_tutorial_pressed():
	var colt_video = load("res://Scene/Tutorials/colt.tscn")
	get_tree().change_scene_to(colt_video)
	yield(get_tree().create_timer(1), "timeout")  # Correct syntax for a delay
#	var youtube_url = "https://www.youtube.com/watch?v=BP4z0wND66w"  # Replace with your URL
#	OS.shell_open(youtube_url)

#colt
func _on_colt_Description_pdf_pressed():
#	Global._setEnumsDescript(2) # glock == 2
	emit_signal("EnumDescript", 2)
	var page = load("res://Scene/UI/Description_page.tscn")
	get_tree().change_scene_to(page)
#	var pdf_url = "https://npshistory.com/publications/battlefield/hwp/colt-45-handling-2017.pdf"  # Replace with your URL
#	OS.shell_open(pdf_url)
#glock
func _on_Description_pdf_pressed():
#	Global._setEnumsDescript(1) # glock == 1
	emit_signal("EnumDescript", 1)
	var page = load("res://Scene/UI/Description_page.tscn")
	get_tree().change_scene_to(page)
#	var pdf_url = "https://us.glock.com/-/media/Global/US/old/US-Site/83-Downloadable-Materials/GLOCK-Warranty-Form-8522.ashx"  # Replace with your URL
#	OS.shell_open(pdf_url)
#mp5
func _on_mp5_Description_pdf_pressed():
#	Global._setEnumsDescript(3) # glock == 3
	emit_signal("EnumDescript", 3)
	var page = load("res://Scene/UI/Description_page.tscn")
	get_tree().change_scene_to(page)
	
#smg
func _on_sm_video_tutorial_pressed():
	var mp5_video = load("res://Scene/Tutorials/mp5.tscn")
	get_tree().change_scene_to(mp5_video)
	yield(get_tree().create_timer(1), "timeout")  # Correct syntax for a delay


