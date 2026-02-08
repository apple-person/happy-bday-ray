extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
signal actioned

func action() -> void:
	if State.can_interact:
		emit_signal("actioned")
		State.can_interact = false
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	return

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	
func _on_dialogue_ended(resource: DialogueResource) -> void:
	State.can_interact = true 
