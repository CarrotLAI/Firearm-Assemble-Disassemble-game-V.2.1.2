extends Control

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
# SQLite database connection
var db = SQLite.new()

func _ready():
	# Connect to the SQLite database
	db.path = "res://DataAccess/database"
	if not db.open_db():
		print("Error opening database")
		return
	else:
		print("successfully connected to database")
	# Create the PlayerInfo table if it doesn't exist
	db.query("CREATE TABLE IF NOT EXISTS PlayerInfo (id INTEGER PRIMARY KEY, username TEXT, password TEXT)")

func _on_Login_pressed():
	var username = $username.text
	var password = $password.text
	var label = get_node("Label")

	# Query the database for the username and password
	var query = "SELECT * FROM PlayerInfo WHERE username = '%s' AND password = '%s'" % [username, password]
	db.query(query)
#	var isSuccess = db.query(query, params)
#	db.query("SELECT * FROM PlayerInfo ;")
#	for i in range(0, db.query_result.size()):
#		print(db.query_result[i]["Username"], db.query_result[i]["Password"])
		
	# Check if the login was successful
	if db.query_result.size() > 0:
		for i in range(0, db.query_result.size()):
			print("Username: ", db.query_result[i]["Username"])
			print("Password: ", db.query_result[i]["Password"])
		print("Login successful!")
		label.text = "Login successful!"
		label.set("custom_colors/font_color", Color(0, 1, 0))
#		yield(wait_time(2), "complete")
		get_tree().change_scene("res://Scene/UI/game_index.tscn")
		
	else:
		print("Invalid username or password")
		label.text = "Invalid username or password"
		label.set("custom_colors/font_color", Color(1, 0, 0))

func _on_timer_timeout():
	print("timeout")
	get_tree().change_scene("res://Scene/UI/game_index.tscn")
	
func _on_UsernameLineEdit_text_changed(new_text):
	# You can add code here to handle username input changes
	pass

func _on_PasswordLineEdit_text_changed(new_text):
	# You can add code here to handle password input changes
	pass


