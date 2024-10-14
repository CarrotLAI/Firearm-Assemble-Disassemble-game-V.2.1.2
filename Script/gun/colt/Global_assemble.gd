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

#signals
signal spring_area_val(e)
signal magazine_val(e)
signal slide_val(e)
signal barrel_val(e)


func _ready():
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
	
	if condition_to_win.barel_area == 1:
		if condition_to_win.spring_area == 1:
			if condition_to_win.slide_area == 1:
				if condition_to_win.mag_area == 1: 
					main.add_child(resultUI)
					pass_time_result()
					set_process(false)

func pass_time_result():
	var time = resultUI.get_node(".")
	time.get_result_time(total_time)


func _on_colt_slide_parent_colt_barrel_area(value):
	if condition_to_win.barel_area != 1:
		if value == 1:
#		if area.name == "colt_barrel_area":
			condition_to_win.barel_area = 1
			set_process(true)
			print(condition_to_win)
			emit_signal("spring_area_val", condition_to_win.barel_area)

func _on_colt_slide_parent_spring_skeleton_area(value):
	if condition_to_win.spring_area != 1:
		if value == 1:
#		if area.name == "spring_skeleton_area":
			condition_to_win.spring_area = 1
			print("spring: ",condition_to_win.spring_area)
			emit_signal("spring_area_val", condition_to_win.spring_area)



#Sgnal
signal slide_enter(value)
signal magazine_enter(value)

func _on_magazine_area_area_entered(area):
	if(area.name == "mag_area"):
		emit_signal("magazine_enter", 1)
		if condition_to_win.mag_area != 1:
			if area.name == "mag_area":
				condition_to_win.mag_area = 1
				print(condition_to_win.mag_area)

func _on_slide_area_area_entered(area):
	if(area.name == "slide_area"):
		emit_signal("slide_enter", 1)
		if condition_to_win.slide_area !=  1:
			if area.name == "slide_area":
				condition_to_win.slide_area = 1
				print(condition_to_win.slide_area)