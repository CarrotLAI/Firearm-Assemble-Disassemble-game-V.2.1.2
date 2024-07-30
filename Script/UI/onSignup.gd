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

#func _on_submit_pressed():
#	CreateUser.emit(usrLogin.text, usrPass.text)
#	pass

func _on_create_pressed():
	var username = $username.text
	var password = $password.text.strip_edges()
	var confirm = $password_confirm.text.strip_edges()
	var label = $Label.text
	print(password, confirm)
	
	if password == confirm:
		var query = "INSERT INTO PlayerInfo (Username, Password) VALUES ('%s', '%s')" % [username, password]
		db.query(query)
		username = ""
		password = ""
		confirm = ""
		label = "Account Created"
		
		var selQuery = "SELECT * FROM PlayerInfo WHERE username = '%s' AND password = '%s'" % [username, password]
		db.query(selQuery)
		if db.query_result.size() > 0:
			for i in range(0, db.query_result.size()):
				print("Username: ", db.query_result[i]["Username"])
			var last_id = db.query_result[db.query_result.size() - 1]["id"]
			print("Last ID: ", last_id)
#		var result = db.execute("SELECT last_insert_rowid()", [])
#		var last_insert_id = result[0][0]
#		print("Last inserted ID: ", last_insert_id)
#		if last_insert_id > 0:
#		if db.query:
#			print("Account Created")
#		else:
#			print("Failed to create an account")
	else:
		print("password did not match")
		
