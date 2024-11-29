extends Node

#signal LoginUser(user, password)
#signal CreateUser(user, password)
#
##@Export var CreateUserWindow : PackedScene
#
#var username = ""
#var password
#var profile
#
#var dao = DB.new()
#db
#var db_username = "admin"
#var db_password = "admin".sha256_text()

#var created = false
#login
onready var log_username = $TabContainer/Login/log_username
onready var log_password = $TabContainer/Login/log_password


#signup
onready var create_username = $TabContainer/Signup/username
onready var create_password = $TabContainer/Signup/password
onready var create_password_confirm = $TabContainer/Signup/password_confirm
onready var sign_up_label = $TabContainer/Signup/SignUp_Label
onready var email = $TabContainer/Signup/email


func _ready():
	SilentWolf.Auth.connect("sw_registration_succeeded", self, "_on_registration_succeeded")
	SilentWolf.Auth.connect("sw_registration_failed", self, "_on_registration_failed")
	SilentWolf.Auth.connect("sw_login_succeeded", self, "_on_login_succeeded")
	SilentWolf.Auth.connect("sw_login_failed", self, "_on_login_failed")
	

# Called when the node enters the scene tree for the first time.
#func _ready():
#	$VBoxContainer/username.rect_size(653, 25)
#	$VBoxContainer/password.rect_size(653, 25)
func _on_login_succeeded():
	print("Login succeeded!")
	print("logged in as: " + str(SilentWolf.Auth.logged_in_player))

func _on_login_failed(error):
	print("Error: " + str(error))

func _on_registration_succeeded():
	print("Registration succeeded!")
	
func _on_registration_failed(error):
	print("Error: " + str(error))
#login user Script
#func _on_Login_pressed():
#	if !created:
#		username = node_username.text
#		password = node_password.text.sha256_text()
#		if username == db_username and password == db_password:
#			created = true
#			node_username.text = ""
#			node_password.text = ""
#			print("account Created")
#		else:
#			created = false
#			node_username.text = ""
#			node_password.text = ""
#			print("login failed")
#	#Added from Tutorial
#		var userData = dao.GetUserFromDB(data.data.username)
#		if(userData.hashedPassword == cryptoUtil.HashPassword(data.data.password, userData.salt)):
#			var returnData = {
#				"username" : userData.name,
#				"id" : userData.id,
#				"message" : Utilities.Message.playerinfo,
#				"score" : userData.score
#			}
#			peer.get_peer(data.peer).put_packet(JSON.stringify(returnData).to_utf8_buffer())
#		else:
#			var returnData ={
#				"message" : Utilities.Message.failedToLogin,
#				"text" : "Failed to login invalid username or password"
#			}
#			6peer.get_peer(data.peer).put_packet(JSON.stringify(returnData).to_utf8_buffer())
#	LoginUser.emit($username, $password)


#signal addPlayerInfo(name, password, salt)

#Create user Script
func _on_create_pressed():	
#func addPlayerInfo(name: String, password: String, salt: String) -> bool:
	var username = create_username.text
	var password = create_password.text
	var confirm_password = create_password_confirm.text
	var email_entry = email.text
	var salt = "asfhalksh12lk4234"
	if name != "" && password != "":
		SilentWolf.Auth.register_player(username, email_entry, password, confirm_password)
#		emit_signal("addPlayerInfo", name, password, salt)
	else:
		sign_up_label.text = "no valid input inside the textbox"
		print("no valid input inside the textbox")

func _on_Login_pressed():
	var username = log_username.text
	var password = log_password.text
	var label = get_node("Label")
	if SilentWolf.Auth.login_player(username, password):
#		label.text = "Login successful!"
#		label.set("custom_colors/font_color", Color(0, 1, 0))
#		yield(wait_time(2), "complete")
		get_tree().change_scene("res://Scene/UI/game_index.tscn")
