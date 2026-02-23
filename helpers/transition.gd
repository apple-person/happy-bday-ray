extends Area2D

@export_file("*.tscn") var target_path: String

func _change_scene() -> void:
	get_tree().change_scene_to_file(target_path)

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player entered!")
		call_deferred("_change_scene")
