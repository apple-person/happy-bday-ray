extends Control

@onready var points = $CenterContainer/points

@onready var anim_player = $AnimationPlayer
@onready var ray = $Ray
@onready var henry = $Henry

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	State.evaluatePoints()
	points.text = "Points:\n" + str(State.totalPoints)
	anim_player.play("new_animation")
