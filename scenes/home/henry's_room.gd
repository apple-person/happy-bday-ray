extends Node2D

@onready var to_home := $to_home
@onready var sprite: Sprite2D = $Sprite2D 

func _ready():
	for spawn in $SpawnPoints.get_children():
		print("spawn: ", spawn.spawn_id, " global:", State.spawn_id)
		if spawn.spawn_id == State.spawn_id:
			$Henry.global_position = spawn.global_position
			break
	
	if not QuestManager.bed_made:
		QuestManager.get_ready_quest()
		await QuestManager.ready_for_day
	
	sprite.region_rect = Rect2(0, 0, 128, 256)
	to_home.open_area()
	$bed.dialogue_start = "go_sleep"
