extends Control

var house_scene = preload("res://scenes/home/cutscene.tscn")
@onready var buttons_menu = $CenterContainer/buttons
@onready var credits_menu = $CenterContainer/credits

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(house_scene)

func _on_credits_pressed() -> void:
	buttons_menu.visible = false
	credits_menu.visible = true

func _on_back_pressed() -> void:
	buttons_menu.visible = true
	credits_menu.visible = false
