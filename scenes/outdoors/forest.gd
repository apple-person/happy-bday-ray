extends Node2D

@export var bunny_scene: PackedScene
var colors = ["white", "tan", "brown", "black"]
var bunnies

func _ready() -> void:
	_spawn_bunnies()

func _spawn_bunnies() -> void:
	for i in range(10):
		var bunny = bunny_scene.instantiate()
		add_child(bunny)
		
		var randx = randf_range($bun_spawn_point.global_position.x, $bun_spawn_point2.global_position.x)
		var randy = randf_range($bun_spawn_point.global_position.y, $bun_spawn_point2.global_position.y)
		
		bunny.global_position = Vector2(randx, randy)
		bunny.add_to_group("bunnies")
		bunny.color = colors[randi_range(0, 3)]

		var sprite = bunny.get_node("AnimatedSprite2D")
		sprite.play(bunny.color + "_idle")
		
		print("color: " + bunny.color + " index: " + str(i))

	bunnies = get_tree().get_nodes_in_group("bunnies") # "Item" is the name of group
