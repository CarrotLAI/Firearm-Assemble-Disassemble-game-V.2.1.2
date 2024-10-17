extends Control

class_name PlayerDB

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var db # database object
var db_name = "res://DataAccess/database.db" # path to db
var userlist = []

#var
onready var leaderboard = $leaderboard
onready var ld_back = $ld_back


# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path = db_name
	LeaderboardFormat()
	
func readFromDB():
	db.open_db()
	var tableName = "PlayerInfo"
	db.query("SELECT * FROM " + tableName + ";")
	for i in range(0, db.query_result.size()):
		userlist.add(db.query_result[i]["Username"])
		print(db.query_result[i]["Username"], db.query_result[i]["Password"])
		

func LeaderboardFormat():
	leaderboard.rect_position = Vector2(0, 140)
	leaderboard.rect_size = Vector2(810, 500)
	
	ld_back.rect_position = Vector2(0, 800)
