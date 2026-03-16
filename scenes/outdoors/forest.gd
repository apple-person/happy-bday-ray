extends Node2D

@export var bunny_scene: PackedScene
var colors = ["white", "tan", "brown", "black"]
@onready var spawn_points = [$bun_spawn_point, $bun_spawn_point2, $bun_spawn_point3]
var bunnies

func _ready() -> void:
	_spawn_bunnies()

func _spawn_bunnies() -> void:
	for i in range(10):
		var bunny = bunny_scene.instantiate()
		add_child(bunny)
		bunny.global_position = spawn_points[randi_range(0, 2)].global_position
		bunny.add_to_group("bunnies")
		bunny.color = colors[randi_range(0, 3)]

		var sprite = bunny.get_node("AnimatedSprite2D")
		#sprite.play()
		sprite.play(bunny.color + "_run")
		
		#print("color: " + bunny.color + " index: " + str(i))

	bunnies = get_tree().get_nodes_in_group("bunnies") # "Item" is the name of group
