extends Control

#onready var control = $Control
# Load the scene you want to add
#var scene_to_add = preload("res://Scene/select_lvl.tscn")
## Instantiate the scene
#var instance = scene_to_add.instance()

#signal start_game(value)
onready var game_interface = $"."
var description = load("res://Scene/UI/Description.tscn")
var glock_disassemble = load("res://Scene/model_glock/glock_disassemble.tscn")
var glock_assemble = load("res://Scene/model_glock/glock_assemble.tscn")
#instance
var descript_instance = description.instance()

onready var control = $Control
onready var glock = $menu_buttons/guns/vbox/glock


#func _on_easy_pressed():
#	get_tree().change_scene_to(easy_scene)

func _on_disassemble_pressed():
	get_tree().change_scene_to(glock_disassemble)


func _on_assemble_pressed():
	get_tree().change_scene_to(glock_assemble)
#	emit_signal("start_game", true)

#func _on_glock_button_down():
#	control.set_visible(true)
#	control.get_node("ColorRect").set_visible(true)
#	control.get_node("RichTextLabel").set_visible(true)


#func _on_glock_button_up():
#	control.set_visible(false)
#	control.get_node("ColorRect").set_visible(false)
#	control.get_node("RichTextLabel").set_visible(false)
#

func _on_glock_mouse_entered():
	control.set_visible(true)
	control.get_node("ColorRect").set_visible(true)
	control.get_node("RichTextLabel").set_visible(true)
	return
func _on_glock_mouse_exited():
	control.set_visible(false)
	control.get_node("ColorRect").set_visible(false)
	control.get_node("RichTextLabel").set_visible(false)
	return

func _on_glock_pressed():
	glock.disconnect("mouse_entered", self, "_on_glock_mouse_entered")
	glock.disconnect("mouse_exit", self, "_on_glock_mouse_exited")
