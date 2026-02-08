extends Area2D

@export var target: PackedScene

# Called when the node enters the scene tree for the first time.
'''func _ready() -> void:
	pass # Replace with function body.'''

func _change_scene() -> void:
	get_tree().change_scene_to_packed(target)

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player entered!")
		_change_scene()
