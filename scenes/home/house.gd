extends Node2D

@onready var to_store_center := $to_store_center

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for spawn in $SpawnPoints.get_children():
		print(spawn.spawn_id, State.spawn_id)
		if spawn.spawn_id == State.spawn_id:
			$Henry.global_position = spawn.global_position
			break
	
	if not QuestManager.hints_found:
		State.can_interact = false
		
		DialogueManager.show_dialogue_balloon(load("res://dialogue/day.dialogue"), "looking_around")
		await DialogueManager.dialogue_ended
		
		State.can_interact = true
		
		await QuestManager.got_hint
		
	to_store_center.open_area()
	
	if QuestManager.ray:
		$ray.visible = true
		$StaticBody2D/CollisionShape2D7.disabled = false
		$ray/Actionable2.monitorable = true
		$ray/Actionable2.monitoring = true
		
	if QuestManager.ray or State.rabbit_amount >= 2:
		to_store_center.visible = false 
