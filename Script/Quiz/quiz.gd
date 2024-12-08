extends Control

onready var DisplayText = $VBoxContainer/DisplayText
onready var item_list = $VBoxContainer/ItemList
onready var button = $VBoxContainer/Button

var back_to_menu = preload("res://Scene/UI/game_index.tscn")

#var items: Array = read_json_file("json/quiz2.json")
var item: Dictionary
var index_item: int = 0

var correct: float = 0
var player_name
#metadata
var leaderBrd_name = "main"

# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_scene()
	player_name = Global._getPlayerName() + " Glock Assemble"

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

var items: Array = [
	{
	"question": "What is the Glock 17 effective range?",
	"options": [
	  "Approximately 60 meters",
	  "Approximately 50 meters"
	],
	"correctAnswerIndex": 1
	},
	{
	"question": "What is the standard magazine capacity of the Glock 17?",
	"options": [
	  "17 rounds",
	  "19 rounds"
	],
	"correctAnswerIndex": 0
	},
	{
	"question": "How much does a loaded Glock 17 weigh?",
	"options": [
	  "36.2 ounces (1000 grams)",
	  "32.1 ounces (910 grams)"
	],
	"correctAnswerIndex": 1
	},
	{
	"question": "What is the barrel length of a Glock 17?",
	"options": [
	  "190mm",
	  "186mm"
	],
	"correctAnswerIndex": 0
  },
  {
	"question": "Is the Glock 17 fully automatic?",
	"options": [
	  "No, it's a semi-automatic",
	  "Yes"
	],
	"correctAnswerIndex": 0
  }
]
