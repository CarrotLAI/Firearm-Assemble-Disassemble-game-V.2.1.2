extends Spatial

onready var timer = $time/Timer
onready var main = $".."
onready var condition_to_win = {
	"mag_area": 0,
	"slide_area": 0,
	"spring_area": 0, 
	"barel_area": 0
}
var result_scene = load("res://Scene/result/Colt_result.tscn")
var try_again = load("res://Scene/result/try_again.tscn")
# Instantiate the scene
var try_again_scene = try_again.instance()
var resultUI = result_scene.instance()
#onready var ray_cast = $Spatial/RayCast
var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var switch = false
var game_status = "defeat"

#var for time
onready var timer_label = $time/VBoxContainer/timer_label
var time_passed
var total_time
var time = 0
var time_left
var is_time = false
var secs
var mins
var time_secs
var time_mins

#sfx
#onready var metal_click = $"%metal_click"
onready var instruction = $"%instruction"
onready var slide_lock = $"%slide_lock"


func _ready():
	EnumsInstruction(1)
	set_process(false)

func _on_Timer_timeout():
	if game_status == "win":
		timer.stop()
		
	else:
		print("game over")
		main.add_child(try_again_scene)


func _on_magazine_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
#			start_timer()
			set_process(true)
			is_time = true


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
	
	if condition_to_win.mag_area == 1: 
		if condition_to_win.slide_area == 1:
			if condition_to_win.spring_area == 1:
				if condition_to_win.barel_area == 1:
					main.add_child(resultUI)
					pass_time_result()
					set_process(false)

func pass_time_result():
	var time = resultUI.get_node(".")
	time.get_result_time(total_time)
	

func _on_magazine_area_area_exited(area):
	if condition_to_win.mag_area != 1:
		if area.name == "magazine_area":
#			metal_click.play()
			EnumsInstruction(3)
			slide_lock.set_visible(true)
			condition_to_win.mag_area = 1
			print(condition_to_win.mag_area)

func _on_slide_area_area_exited(area):
	if condition_to_win.slide_area !=  1:
		if area.name == "slide_area":
			condition_to_win.slide_area = 1
			print(condition_to_win.slide_area)
	

func _on_spring_area_area_exited(area):
	if condition_to_win.spring_area != 1:
		if area.name == "spring_area":
			condition_to_win.spring_area = 1
			print("spring: ",condition_to_win.spring_area)
	
func _on_barel_area_area_exited(area):
	if condition_to_win.barel_area != 1:
		if area.name == "barrel_area":
			condition_to_win.barel_area = 1
			set_process(true)
			print(condition_to_win)
			
func EnumsInstruction(e):
	if(e == 1):
		instruction.text = "Check bullet"
#		instruction.rect_position = Vector2(650, 50)
#		instruction.rect_size = Vector2(960, 200)
	if(e == 2):
		instruction.text = "Remove Magazine"
	if(e == 3):
		instruction.text = "Click slide lock"
	if(e == 4):
		instruction.text = "Remove slide"
	if(e == 5):
		instruction.text = "Remove Spring"
	if(e == 6):
		instruction.text = "Remove Barrel"
	

#slide
func _on_slide_main_send_instruction(val):
	EnumsInstruction(val)
