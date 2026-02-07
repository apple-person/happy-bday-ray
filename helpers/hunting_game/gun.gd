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

func pickup():
	picked_up = true
	$Area2D.set_deferred("monitoring", true)

	get_parent().remove_child(self)
	player.add_child(self)
	
	player.gun = self

	global_position = player.global_position + float_offset
	
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

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		pickup()
