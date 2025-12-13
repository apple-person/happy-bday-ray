extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func action() -> void:
	#if Input.is_action_just_pressed("ui_accept"):
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	return
