extends Node2D

@onready var canvas:= $CanvasLayer
@onready var objective_label:= $CanvasLayer/VBoxContainer/objective_text
@onready var desc_label:= $CanvasLayer/VBoxContainer/description

func set_objective(_new_text: String, _desc: String) -> void:
	canvas.show()
	objective_label.text = "objective: " + _new_text
	if _desc:
		desc_label.text = _desc
	

func complete_objective() -> void: 
	objective_label.text = "COMPLETED!"
	desc_label.text = "good job!"
	await get_tree().create_timer(2.0).timeout
	canvas.hide()
	await get_tree().create_timer(3.0).timeout
