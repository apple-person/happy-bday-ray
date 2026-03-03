extends Node2D

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(load("res://dialogue/day.dialogue"), "start")
	await DialogueManager.dialogue_ended
	
	var house_scene = load("res://scenes/home/henry's_room.tscn")
	get_tree().change_scene_to_packed(house_scene)
	
	State.can_interact = false
	DialogueManager.show_dialogue_balloon(load("res://dialogue/day.dialogue"), "henry_room")
	await DialogueManager.dialogue_ended
	State.can_interact = true
	
