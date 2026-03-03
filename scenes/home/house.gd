extends Node2D

var started_looking := true 
@onready var to_store_center := $to_store_center
@onready var ray := $ray

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if started_looking:
		State.can_interact = false
		
		DialogueManager.show_dialogue_balloon(load("res://dialogue/day.dialogue"), "looking_around")
		await DialogueManager.dialogue_ended
		
		State.can_interact = true
		
		await QuestManager.got_hint
		
		to_store_center.set_deferred('monitoring', true)
		to_store_center.set_deferred('monitorable', true)


	if State.gifts_inventory.size() == 2:
		ray.visible = true
