extends Node2D

var gifts_inventory = ["potted_plant", "cat_plush"]
var gifts_points = {
	"potted_plant" = 15,
	"cat_plush" = 10,
	"haj_plush" = 15,
	"stew" = 20,
}
var points

func evaluatePoints() -> int:
	var totalPoints = 0
	
	for key in gifts_points:
		if gifts_inventory.has(key):
			totalPoints += gifts_points[key]
		#print("key: ", key, ", value: ", value)
	return totalPoints


func _interact_toys(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/first_meeting.dialogue"), "start")
		return

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
