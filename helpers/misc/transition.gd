extends Area2D

@export_file("*.tscn") var target_path: String
@onready var sprite: Sprite2D = $Sprite2D if has_node("Sprite2D") else null
@export var target_spawn_id := ""

func _change_scene() -> void:
	State.spawn_id = target_spawn_id
	print(State.spawn_id)
	get_tree().change_scene_to_file(target_path)

func _on_body_entered(body):
	if body.is_in_group("player"):
		#print("Player entered!")
		call_deferred("_change_scene")

func open_area():
	#print("aaaaa")
	set_deferred("monitorable", true)
	set_deferred("monitoring", true)
	
	if sprite:
		sprite.region_rect = Rect2(416.0, 52.0, 299.0, 351.0)
