extends Spatial

class_name PlayerDB

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
#	readFromDB()
	var table = {
		"ID" : {"data_type": "int", "primary_key" : true, "not_null" : true, "auto_increment"  : true},
		"Username": {"data_type" : "text"},
		"Password" : {"data_type" : "text"},
		"salt" :{"data_type" : "text", "not_null" : true}
	}
#	db.create("PlayerInfo", table)
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
		print_debug(db.query_result[i]["Username"], db.query_result[i]["Password"])
		
	
#adding user
func addPlayerInfo(name, password, salt) -> bool:
	var data = {
		"Username" : name,
		"Password" : password,
		"salt" : salt
	}
	var result = db.insert_row("PlayerInfo", data)
	if result == OK:
		print("Player info inserted successfully!")
		return true
	else:
		print("Error inserting player info: ", db.get_last_error())
		return false

#getplayerdata
func getPlayerFromDB(username):
	var query = "SELECT salt, Password, ID from players where Username = ?"
	var paramBindings = [username]
	db.query_with_bindings(query, paramBindings)
	for i in db.query_result:
		return{
			"ID" : i["id"],
			"hashedPassword" : i["password"],
			"salt" : i["salt"],
			"Username" : username
		}
		
#generate salt
func generate_salt(length: int = 16) -> String:
	var salt = ""
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for i in range(length):
		salt += chars[rng.randi_range(0, chars.length() - 1)]
	return salt
