extends Node2D

@onready var to_home := $to_home

func _ready() -> void:
	await QuestManager.got_gifts
	to_home.set_deferred("monitorable", true)
	to_home.set_deferred("monitoring", true)
