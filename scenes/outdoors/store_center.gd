extends Node2D

@onready var to_home := $to_home

func _ready() -> void:
	if State.gifts_inventory.size() >= 2: 
		to_home.open_area()
	
	for spawn in $SpawnPoints.get_children():
		if spawn.spawn_id == State.spawn_id:
			$Henry.global_position = spawn.global_position
			break
