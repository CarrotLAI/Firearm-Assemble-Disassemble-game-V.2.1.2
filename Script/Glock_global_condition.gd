extends Spatial

var isMagazine_enter = false
var isSlide_main_enter = false
onready var main = $".."
var game_status = "defeat"

#instanc
var result_scene = load("res://Scene/result/glock_result_asse.tscn")
var try_again = load("res://Scene/result/try_again_glock_assemble.tscn")
# Instantiate the scene
var try_again_scene = try_again.instance()
var resultUI = result_scene.instance()
onready var sprite = $time/Sprite

#var for time
onready var timer = $time/Timer
onready var timer_label = $time/VBoxContainer/timer_label
var total_time
var time_secs
var time_mins
var time_passed
var time = 0
var time_left
var is_time = false
var secs
var mins


signal area_lock(value)
signal slide_area_lock(value)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	get_tree().connect("gameplay_entered", self, "_on_gameplay_entered")
#	set_process(false)

func _ready():
	EnumsInstruction(1)
	set_process(false)	

func _on_Main_start_game(value):
	if value:
		set_process(true)
#		print("set_process to true")

func _on_Timer_timeout():
	if game_status == "win":
		timer.stop()
		
	else:
		print("game over")
		main.add_child(try_again_scene)


func _process(delta):
	is_time = true
	if is_time:
		time += delta
		time_left = timer.time_left
	
	mins = floor(time_left/60)
	secs = int(time_left) % 60
	time_secs = fmod(time, 60)
	time_mins = fmod(time, 60*60) / 60
	
	total_time =  "%02d : %02d" % [time_mins, time_secs]
	time_passed = "%02d : %02d" % [mins, secs]
#	total_time = time_passed - time
	timer_label.text = time_passed

	if isMagazine_enter && isSlide_main_enter: 
		game_status = "win"
		sprite.set_visible(false)
		main.add_child(resultUI)
		pass_time_result()
		set_process(false)

func pass_time_result():
	var time = resultUI.get_node(".")
	time.get_result_time(total_time)

func _on_magazine_area_area_entered(area):
	print_debug(area.get_parent().get_parent())
	var magazine = area.get_parent().get_parent()
	if magazine:
		isMagazine_enter = true
		emit_signal("area_lock", isMagazine_enter)

onready var slide_main = $"%slide_main"

func _on_slide_area_area_entered(area):
#	print_debug(area.get_parent().get_parent().get_parent())
	if area.name == "slide_area":
		var slide_main = area.get_parent().get_parent().get_parent()
		if slide_main:
			isSlide_main_enter = true
#		var nextPos = Vector3(-0.069, 0.5, 0.802)
#		EnumsInstruction(4)
			emit_signal("slide_area_lock", isSlide_main_enter)

onready var instruction_lbl = $"%instruction_lbl"

func EnumsInstruction(e):
	if(e == 1):
		get_node("%instruction_lbl").text = "Insert Barrel"
	if(e == 2):
		instruction_lbl.text = "Insert Spring"
	if(e == 3):
		instruction_lbl.text = "Insert Slide"
	if(e == 4):
		instruction_lbl.text = "Insert Magazine"



func _on_slide_main_send_instruction(val):
	EnumsInstruction(val)
