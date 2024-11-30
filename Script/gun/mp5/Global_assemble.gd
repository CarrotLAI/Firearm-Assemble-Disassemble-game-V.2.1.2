extends Spatial

onready var timer = $time/Timer
onready var main = $".."
onready var condition_to_win = {
	"mag_area": 0,
	"grip_area": 0,
#	"spring_area": 0, 
#	"bolt_carrier2_area": 0,
	"stock_area": 0,
	"vertical_area": 0,
#	"bolt_carrier": 0,
	"recoil_spring": 0,
}
var result_scene = load("res://Scene/result/mp5_result_asse.tscn")
var try_again = load("res://Scene/result/try_again_mp5_assemble.tscn")
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
onready var body_frame = $"%body_frame"
onready var instruction = $"%instruction"


func _ready():
	set_process(false)
	yield(get_tree().create_timer(1), "timeout")  # Correct syntax for a delay
	set_process(true)	
	EnumsInstruction(0)

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
	
	if condition_to_win.mag_area == 1 && condition_to_win.stock_area == 1 && condition_to_win.vertical_area == 1 && condition_to_win.recoil_spring == 1 && condition_to_win.grip_area == 1:
		main.add_child(resultUI)
		pass_time_result()
		set_process(false)

func pass_time_result():
	var time = resultUI.get_node(".")
	time.get_result_time(total_time)
	

signal defaultmag(val)
func _on_magazine_area_area_entered(area):
	if condition_to_win.mag_area != 1:
#		if area.name == "magazine_area":
		if area.name == "mag_area":
			emit_signal("defaultmag", true)
#			metal_click.play()
			condition_to_win.mag_area = 1
			EnumsInstruction(5)
			print(area.name)
			
func _on_magazine_area_area_exited(area):
	pass

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
			

signal defaultGrip(val)
func _on_grip_area_area_entered(area):
	if area.name == "grip_area":
		emit_signal("defaultGrip", true)
		condition_to_win.grip_area = 1
#		set_process(true)
		print("grip_area")
		EnumsInstruction(4)

signal defaultStock(val)
func _on_stock_area_area_entered(area):
	print(area.name)
	if area.name == "stock_Area":
		emit_signal("defaultStock", true)
#		body_frame.set_visible(false)
		condition_to_win.stock_area = 1
#		set_process(true)
#		print("stock_area")
		EnumsInstruction(3)
		
signal defaultVertical(val)
func _on_front_grip_area_entered(area):
	if area.name == "vertical_Area":
		emit_signal("defaultVertical", true)
		condition_to_win.vertical_area = 1
#		set_process(true)
		print(condition_to_win)
		
signal defaultPos(val)
onready var bolt_carrier = $"%bolt_carrier"
func _on_bolt_carrier_area_entered(area):
	if area.name == "Bolt_Carrier_mesh_Area":
		emit_signal("defaultPos", true)
		EnumsInstruction(1)		

signal defaultRecoil(val)
func _on_recoil_spring_area_entered(area):
	if area.name == "recoil_spring":
		emit_signal("defaultRecoil", true)
		condition_to_win.recoil_spring = 1
#		set_process(true)
		print(area.name)
		EnumsInstruction(2)
	
func _on_crank_removeBullet(value):
	if value == true:
		print("remove bullet")
		EnumsInstruction(2)
	
func _on_bolt_head_remove_boltHead(val):
	if val == true:
		print("remove bolt head")
		EnumsInstruction(9)
		
func _on_firing_pin_remove_firingPin(val):
	if val == true:
		print("remove firing pin")
		EnumsInstruction(10)
		
func _on_recoils_spring_remove_recoilSpring(val):
	if val == true:
		print("remove firing pin")
		
func EnumsInstruction(e):
	if(e == 0):
		instruction.text = "assemble bolt"
	if(e == 1):
		instruction.text = "insert recoil spring"
	if(e == 2):
#		instruction.rect_position = Vector2(650, 50)
#		instruction.rect_size = Vector2(960, 200)
		instruction.text = "insert stock"
	if(e == 3):
		instruction.text = "insert grip"
	if(e == 4):
		instruction.text = "insert magazine"
	if(e == 5):
		instruction.text = "insert front stock"
#	if(e == 6):
#		instruction.text = "remove recoil"
#	if(e == 7):
#		instruction.text = "remove bolt carrier"
#	if(e == 8):
#		instruction.text = "remove holder pin"
#	if(e == 9):
#		instruction.text = "remove vertical stock"
