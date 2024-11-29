extends Spatial



onready var timer = $time/Timer
onready var main = $".."
onready var condition_to_win = {
	"mag_area": 0,
	"barel_area": 0,
	"stock_area": 0,
	"vertical_area": 0,
	"bolt_carrier": 0,
	"recoil_spring": 0,
	"grip_area": 0,
	"bolt_head": 0
}
var result_scene = load("res://Scene/result/mp5_result_dis.tscn")
var try_again = load("res://Scene/result/try_again_mp5_disassemble.tscn")
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
#onready var timer_label = $time/VBoxContainer/timer_label
onready var timer_label = $"%timer_label"

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
onready var body_frame = $"%body_frame"
onready var instruction = $"%instruction"


func _ready():
	EnumsInstruction(1)
	set_process(false)

func _on_Timer_timeout():
	if game_status == "win":
		timer.stop()
		
	else:
		print("game over")
		main.add_child(try_again_scene)


#func _on_magazine_area_input_event(camera, event, position, normal, shape_idx):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		if event.is_pressed():
##			start_timer()
#			set_process(true)
#			is_time = true

func _on_crank_startGame(value):
	print(value)
	if value == true:
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
	
	if condition_to_win.mag_area == 1 && condition_to_win.stock_area == 1 && condition_to_win.grip_area == 1 && condition_to_win.vertical_area == 1 && condition_to_win.bolt_carrier == 1 && condition_to_win.recoil_spring == 1 && condition_to_win.grip_area == 1 && condition_to_win.bolt_head == 1:
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
			condition_to_win.mag_area = 1
			EnumsInstruction(4)
			print(area.name)

#func _on_slide_area_area_exited(area):
#	if condition_to_win.slide_area !=  1:
#		if area.name == "slide_area":
#			condition_to_win.slide_area = 1
#			print(condition_to_win.slide_area)
	

#func _on_spring_area_area_exited(area):
#	if condition_to_win.spring_area != 1:
#		if area.name == "spring_area":
#			condition_to_win.spring_area = 1
#			print("spring: ",condition_to_win.spring_area)
	
#func _on_barel_area_area_exited(area):
#	if condition_to_win.barel_area != 1:
#		if area.name == "barrel_area":
#			condition_to_win.barel_area = 1
#			set_process(true)
#			print(condition_to_win)
			

func _on_grip_area_area_exited(area):
	if area.name == "grip_area":
		condition_to_win.grip_area = 1
#		set_process(true)
		print("grip_area")
		EnumsInstruction(5)
		
func _on_stock_area_area_exited(area):
	if area.name == "stock_area":
		body_frame.set_visible(false)
		condition_to_win.stock_area = 1
#		set_process(true)
		print("stock_area")
		EnumsInstruction(6)
	
func _on_front_grip_area_exited(area):
	if area.name == "vertical_area":
		condition_to_win.vertical_area = 1
#		set_process(true)
		print(area.name)

func _on_bolt_carrier_area_exited(area):
	if area.name == "bolt_carrier2_area":
		condition_to_win.bolt_carrier = 1
#		set_process(true)
		print(area.name)
		EnumsInstruction(8)		
		
func _on_recoil_spring_area_exited(area):
	if area.name == "recoil_spring":
		condition_to_win.recoil_spring = 1
#		set_process(true)
		print(area.name)
		EnumsInstruction(7)
		
	
func _on_crank_removeBullet(value):
	if value == true:
		print("remove bullet")
		EnumsInstruction(2)
	
func _on_bolt_head_remove_boltHead(val):
	if val == true:
		condition_to_win.bolt_head = 1		
		print("remove bolt head")
		EnumsInstruction(9)
		
func _on_firing_pin_remove_firingPin(val):
	if val == true:
		print("remove firing pin")
		EnumsInstruction(10)
		
#func _on_recoils_spring_remove_recoilSpring(val):
#	if val == true:
#		print("remove firing pin")
		
func EnumsInstruction(e):
	if(e == 1):
		instruction.text = "remove bullet"
	if(e == 2):
#		instruction.rect_position = Vector2(650, 50)
#		instruction.rect_size = Vector2(960, 200)
		instruction.text = "remove magazine"
	if(e == 3):
		instruction.text = "unlock lock pin"
	if(e == 4):
		instruction.text = "remove grip"
	if(e == 5):
		instruction.text = "remove stock"
	if(e == 6):
		instruction.text = "remove recoil"
	if(e == 7):
		instruction.text = "remove bolt carrier"
	if(e == 8):
		instruction.text = "remove holder pin"
	if(e == 9):
		instruction.text = "remove vertical stock"
	






