extends Control

var house_scene = preload("res://scenes/home/cutscene.tscn")
@onready var title_label = $CanvasLayer/Title_Label
@onready var inventory_items = $CanvasLayer/Inventory_Items
@onready var ray_likes = $CanvasLayer/Ray_Likes

func _ready():
	_update_inventory()
	_update_likes()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(house_scene)

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
