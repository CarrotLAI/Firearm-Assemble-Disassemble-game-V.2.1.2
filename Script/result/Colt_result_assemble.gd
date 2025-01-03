extends Spatial


onready var take_quiz = preload("res://Scene/QUIZ/quiz_colt_assem.tscn")
onready var back_start = preload("res://Scene/UI/game_index.tscn")
onready var congratulations = $"."
onready var label = $result/container/time_label
onready var set_false = set_process(false)
var value

#for try agai
#var colt_assemble = load("res://Scene/gun/colt/colt_assemble.tscn")


func _process(delta):
	label.rect_position = Vector2(650, 50)
	label.rect_size = Vector2(100, 0)
	label.text = value
	
func get_result_time(val):
	value = val
	set_process(true)

#for try again menu
#func _on_try_again_pressed():
#	get_tree().change_scene_to(colt_assemble)

func _on_quit_pressed():
	get_tree().change_scene_to(back_start)


func _on_take_quiz_pressed():
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene_to(take_quiz)
