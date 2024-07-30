extends Node

signal LoginUser(user, password)
signal CreateUser(user, password)

#@Export var CreateUserWindow : PackedScene

var username = ""
var password
var profile
#
#var dao = DB.new()
#db
var db_username = "admin"
var db_password = "admin".sha256_text()

var created = false
#login
onready var node_username = $TabContainer/Login/username
onready var node_password = $TabContainer/Login/password
#signup
onready var create_username = $TabContainer/Signup/username
onready var create_password = $TabContainer/Signup/password
onready var create_password_confirm = $TabContainer/Signup/password_confirm

# Called when the node enters the scene tree for the first time.
#func _ready():
#	$VBoxContainer/username.rect_size(653, 25)
#	$VBoxContainer/password.rect_size(653, 25)
	

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


signal addPlayerInfo(name, password, salt)

#Create user Script
func _on_create_pressed():
#func addPlayerInfo(name: String, password: String, salt: String) -> bool:
	var username = create_username.text
	var password = create_password.text
	var salt = "asfhalksh12lk4234"
	if name != ""  and password != "":
		emit_signal("addPlayerInfo", name, password, salt)
	else:
		print("no valid input inside the textbox")
#	var salt = cryptoUtil.GenerateSalt()
#	var hashedPassword = cryptoUtil.HashPassword(data.data.password, salt)
#	MainSystem.InsertUserData(data.data.username, hashedPassword, salt)
#	login(data)
#	if create_password == create_password_confirm:
#		profile = {
#			username = create_username.text,
#			password =  create_password.text.sha256_text()
#		}
#		print(profile)
#	else:
#		print("password doesn't match")
#	#added from Tutorial
#	var createUserWindow = CreateUserWindow.instantiate()
#	add_child(createUserWindow)
#	createUserWindow.CreateUser.connect()
#
##added from Tutorial
#func createUser(name, password):
#	CreateUser.emit(name, password)
#



