extends Control

#onready var control = $Control
# Load the scene you want to add
#var scene_to_add = preload("res://Scene/select_lvl.tscn")
## Instantiate the scene
#var instance = scene_to_add.instance()
var glockCount = 0
var calibreCount = 0
var m16Count = 0
var mp5Count = 0

signal proceed_glock(val)
signal proceed_calibre(val)
signal proceed_m16(val)
signal proceed_smg(val)
 

#signal start_game(value)
onready var game_interface = $"."
var description = load("res://Scene/UI/Description.tscn")
var glock_disassemble = load("res://Scene/model_glock/glock_disassemble.tscn")
var glock_assemble = load("res://Scene/model_glock/glock_assemble.tscn")
#colt
var colt_disassamble = load("res://Scene/gun/colt/colt_disassembly.tscn")
var colt_assemble = load("res://Scene/gun/colt/colt_assembly.tscn")
#mp5
var mp5_disassamble = load("res://Scene/gun/mp5/mp5_disassembly.tscn")
var mp5_assemble = load("res://Scene/gun/mp5/mp5_Assembly.tscn")
#instance
var descript_instance = description.instance()

onready var control = $Control
onready var glock = $menu_buttons/guns/vbox/glock

#Region Database
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
# SQLite database connection
var db = SQLite.new()
var PlayerAchievements = {}

func _ready():
	SilentWolf.configure({
	"api_key": "0cO9IGqn2T5AriYPTbWHy57z2iHCLPHY7ZLznkKg",
	"game_id": "Firearm Simulator",
	"game_version": "1.0.2",
	"log_level": 1
	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})
	set_process(true)
	# Connect to the SQLite database
	db.path = "res://DataAccess/database"
	if not db.open_db():
		print("Error opening database")
		return
	else:
		print("successfully connected to database")
		
	# Create the PlayerInfo table if it doesn't exist
#	db.query("SELECT * FROM PlayerAchievements")
#	if db.query_result.size() > 0:
##		print(db.query_result[0][0])
#		var column_count = db.get_column_count()
#		for i in range(column_count):
#			var column_name = db.get_column_name(i)
#			var column_value = db.get_column_data_as_string(i)
#			print(column_name, ": ", column_value)
#		for i in range(db.query_result.size()):
#			PlayerAchievements.append("Glock-D: ", db.query_result[i]["Glock-D"])
#			if db.fetch_row():

func _on_disassemble_pressed():
	get_tree().change_scene_to(glock_disassemble)


func _on_assemble_pressed():
	get_tree().change_scene_to(glock_assemble)
#	emit_signal("start_game", true)

func _on_glock_pressed():
	glockCount = glockCount + 1  
	calibreCount = 0
#	if glockCount < 1:
##		control.set_visible(false)
	control.get_node("Calibre").set_visible(false)
	control.get_node("M-16").set_visible(false)
#	if calibreCount == 1:
	print("glock is pressed ", glockCount)
	control.set_visible(true)
	control.get_node("ColorRect").set_visible(true)
	control.get_node("RichTextLabel").set_visible(true)
	if glockCount == 2:
		emit_signal("proceed_glock", true)
		control.set_visible(false)
		control.get_node("ColorRect").set_visible(false)
		control.get_node("RichTextLabel").set_visible(false)
		glockCount = 0


func _on_glock_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.doubleclick:
		print("double click")


func _on_calibre45_pressed():
#	set_on_glock_pressed(false)
	calibreCount = calibreCount + 1
	glockCount = 0
#	if calibreCount < 1:
#		control.set_visible(false)
	control.get_node("RichTextLabel").set_visible(false)
	control.get_node("M-16").set_visible(false)
#	if calibreCount == 1:	
	print("calibre is pressed ", calibreCount)
	control.set_visible(true)
	control.get_node("ColorRect").set_visible(true)
	control.get_node("Calibre").set_visible(true)
	if calibreCount == 2:
		emit_signal("proceed_calibre", true)
		control.set_visible(false)
		control.get_node("ColorRect").set_visible(false)
		control.get_node("Calibre").set_visible(false)
		calibreCount = 0


func _on_colt_disassemble_pressed():
	get_tree().change_scene_to(colt_disassamble)


func _on_colt_assemble_pressed():
	get_tree().change_scene_to(colt_assemble)


func _on_smg_disassemble_pressed():
	get_tree().change_scene_to(mp5_disassamble)
	
func _on_Smg2_pressed():
	mp5Count = mp5Count + 1  
#	calibreCount = 0
#	if glockCount < 1:
##		control.set_visible(false)
	control.get_node("RichTextLabel").set_visible(false)
	control.get_node("Calibre").set_visible(false)
	control.get_node("M-16").set_visible(false)
#	if calibreCount == 1:
	print("glock is pressed ", mp5Count)
	control.set_visible(true)
	control.get_node("ColorRect").set_visible(true)
	control.get_node("Smg").set_visible(true)
	if mp5Count == 2:
		emit_signal("proceed_smg", true)
		control.set_visible(false)
		control.get_node("ColorRect").set_visible(false)
		control.get_node("Smg").set_visible(false)
		mp5Count = 0

func _on_smg_assemble_pressed():
	get_tree().change_scene_to(mp5_assemble)
