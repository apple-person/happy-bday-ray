extends Node2D

@onready var to_home := $to_home

func _ready():
	QuestManager.get_ready_quest()
	await QuestManager.got_gun
	to_home.set_deferred("monitorable", true)
	to_home.set_deferred("monitoring", true)
