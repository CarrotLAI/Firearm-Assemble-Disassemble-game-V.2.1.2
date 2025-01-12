extends Spatial

onready var timer = $time/Timer
onready var main = $".."
onready var condition_to_win = {
	"mag_area": 0,
	"slide_area": 0,
	"spring_area": 0, 
	"barel_area": 0
}
var result_scene = load("res://Scene/result/Colt_result_assemble.tscn")
var try_again = load("res://Scene/result/try_again_colt_assemble.tscn")
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
var ins_val = 1

#signals
signal spring_area_val(e)
signal magazine_val(e)
signal slide_val(e)
signal barrel_val(e)


func _ready():
#	EnumsInstruction(ins_val)
	set_process(false)
	yield(get_tree().create_timer(1), "timeout") 
	set_process(true)
	instruction.text = "position the barrel"

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
			EnumsInstruction(2)
			set_process(true)
			print(condition_to_win)
			emit_signal("spring_area_val", condition_to_win.barel_area)

func _on_colt_slide_parent_spring_skeleton_area(value):
	if condition_to_win.spring_area != 1:
		if value == 1:
#		if area.name == "spring_skeleton_area":
			EnumsInstruction(4)
			condition_to_win.spring_area = 1
			print("spring: ",condition_to_win.spring_area)
			emit_signal("spring_area_val", condition_to_win.spring_area)


#Sgnal
signal slide_enter(value)
signal magazine_enter(value)

func _on_magazine_area_area_entered(area):
	print(area)
	if(area.name == "mag_area"):
		emit_signal("magazine_enter", 1)
		if condition_to_win.mag_area != 1:
#			if area.name == "mag_area":
			condition_to_win.mag_area = 1
			print(condition_to_win)
			
func _on_colt_barrel_send_instruction(val):
	if(val == true):
		if condition_to_win.barel_area != 1:
			condition_to_win.barel_area = 1
			EnumsInstruction(2)
			print(condition_to_win)
	
func _on_slide_enter():
	if condition_to_win.slide_area !=  1:
		condition_to_win.slide_area = 1
		print(condition_to_win.slide_area)
#func _on_slide_area_main_area_entered(area):
#	if(area.name == "slide_area"):
#		emit_signal("slide_enter", 1)
#		if condition_to_win.slide_area !=  1:
##			if area.name == "slide_area":
#			EnumsInstruction(6)
#			condition_to_win.slide_area = 1
#			print(condition_to_win.slide_area)
			
onready var mag_area = $"%mag_area"
	
onready var instruction = $"%instruction"
func EnumsInstruction(e):
	if(e == 1):
		instruction.text = "position the barrel"
#		instruction.rect_position = Vector2(650, 50)
		instruction.rect_size = Vector2(960, 200)
	if(e == 2):
		instruction.text = "click the barrel cap to close it"
	if(e == 3):
		instruction.text = "Insert spring"
	if(e == 4):
		instruction.text = "click spring cap to insert"
	if(e == 5):
		instruction.text = "click slide to position it to the body"
	if(e == 6):
		instruction.text = "drag to right to position the lock"
	if(e == 7):
		instruction.text = "insert the slide lock"
		mag_area.set_visible(true)
	if(e == 8):
		instruction.text = "insert the magazine"
		_on_slide_enter()
		var defaultPos = Vector3(0, 0.5, 1.2)
		colt_slide_parent.set_translation(defaultPos)	
		print(condition_to_win)

#5
func _on_spring_cap_send_instruction(val):
#	print(val)
	EnumsInstruction(val)

#2
#func _on_colt_barrel_send_instruction(val):
#	print(val)
#	EnumsInstruction(val)
#	EnumsInstruction(2)

#3
func _on_cylinder_cap_send_instruction(val):
#	print(val)
	EnumsInstruction(val)

#4
#func _on_spring_skeleton_send_instruction(val):
#	print(val)
#	EnumsInstruction(val)
#	EnumsInstruction(6)
onready var colt_slide_parent = $"%colt_slide_parent"

func _on_colt_slide_send_instruction(val):
	if val == true:
		EnumsInstruction(7)


func _on_colt_body_send_descript(val):
	EnumsInstruction(8)


func _on_colt_slide_instruction_click_slide(val):
	if val == true:
		EnumsInstruction(6)
