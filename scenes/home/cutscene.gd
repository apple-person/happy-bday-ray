extends Node2D

func _ready() -> void:
	if State.gifts_inventory.size() < 2:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/day.dialogue"), "start")
		await DialogueManager.dialogue_ended
		
		var house_scene = load("res://scenes/home/henry's_room.tscn")
		get_tree().change_scene_to_packed(house_scene)
		
		State.can_interact = false
		DialogueManager.show_dialogue_balloon(load("res://dialogue/day.dialogue"), "henry_room")
		await DialogueManager.dialogue_ended
		State.can_interact = true
	else:
		get_tree().create_timer(5).timeout
		DialogueManager.show_dialogue_balloon(load("res://dialogue/day.dialogue"), "day_2")
		await DialogueManager.dialogue_ended
		var house_scene = load("res://scenes/home/henry's_room.tscn")
		get_tree().change_scene_to_packed(house_scene)
