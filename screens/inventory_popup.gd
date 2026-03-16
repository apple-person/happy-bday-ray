extends Control

@onready var title_label = $CanvasLayer/Title_Label
@onready var inventory_items = $CanvasLayer/Inventory_Items
@onready var ray_likes = $CanvasLayer/Ray_Likes
@onready var equip_gun = $CanvasLayer/CenterContainer2/VBoxContainer/HBoxContainer3/equip_gun
@export var gun_scene: PackedScene

func _ready():
	var current_scene_name = get_tree().current_scene.name
	print("Current scene name: ", current_scene_name)
	if current_scene_name == "Forest" && State.has_gun:
		equip_gun.visible = true
	_update_inventory()
	_update_likes()

func _on_inventory_pressed() -> void:
	title_label.text = "Inventory"
	ray_likes.visible = false
	inventory_items.visible = true
	_update_inventory()

func _on_ray_likes_pressed() -> void:
	title_label.text = "Things Ray likes"
	ray_likes.visible = true
	inventory_items.visible = false
	_update_likes()

func _on_equip_gun_pressed():
	var henry = get_tree().current_scene.get_node("Henry")

	if not henry.gun:
		var gun = gun_scene.instantiate()
		gun.picked_up = true
		henry.add_child(gun)
		henry.gun = gun
		global_position = henry.global_position + gun.float_offset

func _on_quit_pressed() -> void:
	queue_free()

func _update_inventory():
	if State.gifts_inventory.size() == 0:
		inventory_items.text = "Nothing here yet..."
		return
	
	var inv_display := ""
	for item in State.gifts_inventory:
		inv_display += "- " + item + "\n"
	inventory_items.text = inv_display

func _update_likes():
	if State.known_likes.size() == 0:
		ray_likes.text = "I don't know anything yet..."
		return
	
	var likes_display := ""
	for item in State.known_likes:
		likes_display += "- " + item + "\n"
	
	ray_likes.text = likes_display
