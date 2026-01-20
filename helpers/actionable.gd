extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
var henry

func action() -> void:
	if State.can_interact:
		State.can_interact = false
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	return

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	
func _on_dialogue_ended(resource: DialogueResource) -> void:
	State.can_interact = true 
	# Example action:
	# get_tree().change_scene_to_file("res://next_scene.tscn")
