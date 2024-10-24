extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var control = $"../Control"

#modes node
onready var vbox_glock = $modes/vbox
onready var vbox_calibre = $modes/vbox_calibre
onready var vbox__m_16 = $modes/vbox_M16

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
	var youtube_url = "https://www.youtube.com/watch?v=I5IvD4iwqIE"  # Replace with your URL
	OS.shell_open(youtube_url)


func _on_back_to_mode_pressed():
	notify.set_visible(false)
	get_node("modes").move(Vector2(700,0))
	get_node("guns").move(Vector2(0,0))


func _on_smg_pressed():
	pass # Replace with function body.


func _on_leaderboard_pressed():
	get_node("board").move(Vector2(0,0))
	get_node("start").move(Vector2(700,0))
	
func _on_ld_back_pressed():
	get_node("board").move(Vector2(0,-1225))
	get_node("start").move(Vector2(0,0))


func _on_colt_video_tutorial_pressed():
	var youtube_url = "https://www.youtube.com/watch?v=BP4z0wND66w"  # Replace with your URL
	OS.shell_open(youtube_url)

#colt
func _on_colt_Description_pdf_pressed():
	var pdf_url = "https://npshistory.com/publications/battlefield/hwp/colt-45-handling-2017.pdf"  # Replace with your URL
	OS.shell_open(pdf_url)
#glock
func _on_Description_pdf_pressed():
	var pdf_url = "https://us.glock.com/-/media/Global/US/old/US-Site/83-Downloadable-Materials/GLOCK-Warranty-Form-8522.ashx"  # Replace with your URL
	OS.shell_open(pdf_url)
