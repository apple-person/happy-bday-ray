extends Node2D

@export var float_offset := Vector2(28, 10)
@export var bullet_scene: PackedScene

var player: Node2D = null 
var picked_up:= false
var button: Button = null

func _ready():
	button = Button.new()
	button.text = "Drop Gun"
	button.pressed.connect(unequip)
	add_child(button)
	
func unequip():
	$Area2D.set_deferred("monitoring", false)

	queue_free()
	
	player.gun = null
	player = null

func shoot():
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.add_to_group("bullets")
	bullet.global_position = $Muzzle.global_position
	
	get_tree().call_group("bunnies", "scatter")
