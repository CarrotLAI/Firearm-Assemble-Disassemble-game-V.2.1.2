extends Control

onready var DisplayText = $VBoxContainer/DisplayText
onready var item_list = $VBoxContainer/ItemList
onready var button = $VBoxContainer/Button

var back_to_menu = load("res://Scene/UI/game_index.tscn")

#var items: Array = read_json_file("json/colt_quiz.json")
var item: Dictionary
var index_item: int = 0

var correct: float = 0
var player_name
#metadata
var leaderBrd_name = "main"

# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_scene()
	player_name = Global._getPlayerName() + " Colt Disssemble"

func refresh_scene():
	if index_item >= items.size():
		show_result()
	else:
		show_question()

func show_result():
	item_list.hide()
	button.show()
	var score = round(correct / items.size() * 100)
	var greet
	if score >= 70:
		greet = "Congratulation"
	else:
		greet = "Try again next time"
	DisplayText.text = "{greet} ! Your Score is {score}".format({"greet": greet, "score": score})
	SilentWolf.Scores.persist_score(player_name, score)
	var score_id = yield(SilentWolf.Scores.persist_score(player_name, score, leaderBrd_name), "sw_score_posted")
	print("Score persisted successfully: " + str(score_id))

func show_question():
	item_list.show()
	button.hide()
	item_list.clear()
	item = items[index_item]
	DisplayText.text = item.question
	var options = item.options
	yield_task(1.0)
	for option in options:
		item_list.add_item(option)

func read_json_file(filename):
	var file = File.new()
	file.open(filename, file.READ)
	var text = file.get_as_text()
	var json_data = parse_json(text)
	file.close()
	print(json_data)
	return json_data

func _on_ItemList_item_selected(index):
	if index == item.correctAnswerIndex:
		correct += 1
	index_item += 1
	refresh_scene()


func _on_Button_pressed():
	get_tree().change_scene_to(back_to_menu)
#	correct = 0
#	index_item = 0
#	refresh_scene()

func yield_task(seconds):
	# Create a temporary timer and wait for it to time out
	yield(get_tree().create_timer(seconds), "timeout")

var items: Array = [
	{
	"question": "What year was the .45 caliber 1911 pistol first introduced?",
	"options": [
	  "2000- present",
	  "1911- present"
	],
	"correctAnswerIndex": 1
  },
  {
	"question": "Who is the designer of the caliber 45 1911?",
	"options": [
	  "John Browning",
	  "John Ganier"
	],
	"correctAnswerIndex": 0
  },
  {
	"question": "What kind of bullet does a .45 take?",
	"options": [
	  "45ACP",
	  "46ACP"
	],
	"correctAnswerIndex": 0
  },
  {
	"question": "How many bullets are in a .45 caliber pistol?",
	"options": [
	  "7 rounds",
	  "8 rounds"
	],
	"correctAnswerIndex": 0
  },
  {
	"question": "Where did the caliber .45 originate?",
	"options": [
	  "United States",
	  "Australia"
	],
	"correctAnswerIndex": 0
  }
]
