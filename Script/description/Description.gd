extends Control


#var items: Array = read_json_file("json/description.json")
#var item: Dictionary
#var index_item: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#func show_question():
#	item_list.show()
#	button.hide()
#	item_list.clear()
#	item = items[index_item]
#	DisplayText.text = item.question
#	var options = item.options
#	for option in options:
#		item_list.add_item(option)
#
#
#func read_json_file(filename):
#	var file = File.new()
#	file.open(filename, file.READ)
#	var text = file.get_as_text()
#	var json_data = parse_json(text)
#	file.close()
#	print(json_data)
#	return json_data
