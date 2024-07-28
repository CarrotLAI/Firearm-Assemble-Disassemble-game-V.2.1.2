extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var username = ""
var password
var profile

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
	
func _on_submit_pressed():
	if !created:
		username = node_username.text
		password = node_password.text.sha256_text()
		if username == db_username and password == db_password:
			created = true
			node_username.text = ""
			node_password.text = ""
			print("account Created")
		else:
			created = false
			node_username.text = ""
			node_password.text = ""
			print("login failed")


func _on_create_pressed():
	if create_password == create_password_confirm:
		profile = {
			username = create_username.text,
			password =  create_password.text.sha256_text()
		}
		print(profile)
	else:
		print("password doesn't match")
