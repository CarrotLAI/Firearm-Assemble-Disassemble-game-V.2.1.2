extends Spatial

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")

var db # database object
var db_name = "res://DataAccess/database.db" #path to db

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path = db_name
#	commitDataToDB()
	readFromDB()
	pass

#func commitDataToDB():
#	db.open_db()
#	var tableName = "PlayerInfo"
#	var dict : Dictionary = Dictionary()
#	dict["Username"] = "admin_2"
#	dict["Password"] = "admin_2"
#	db.insert_row(tableName,dict)

func readFromDB():
	db.open_db()
	var tableName = "PlayerInfo"
	db.query("SELECT * FROM " + tableName + ";")
	for i in range(0, db.query_result.size()):
		print(db.query_result[i]["Username"], db.query_result[i]["Password"])
		
	
func getItemsByUserId(id):
	pass
