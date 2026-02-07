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
		bunny.global_position = $bun_spawn_point.global_position + Vector2(i * 20, 0)
		bunny.add_to_group("bunnies")
		bunny.color = colors[randi_range(0, 3)]

		var sprite = bunny.get_node("AnimatedSprite2D")
		#sprite.play()
		sprite.play(bunny.color + "_run")
		
		#print("color: " + bunny.color + " index: " + str(i))

	bunnies = get_tree().get_nodes_in_group("bunnies") # "Item" is the name of your group
