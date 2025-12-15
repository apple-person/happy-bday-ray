extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var marker: Marker2D = $Direction


var current_anim: String = ""

func _play_animation(anim_name: String):
	if anim_name == "" or current_anim == anim_name:
		return

	current_anim = anim_name
	anim_player.play(anim_name)

func _play_walk_animation():
	var anim := ""

	# Horizontal has priority
	if velocity.x > 0:
		anim = "right_walk"
	elif velocity.x < 0:
		anim = "left_walk"
	elif velocity.y > 0:
		anim = "down_walk"
	elif velocity.y < 0:
		anim = "up_walk"

	_play_animation(anim)

func _play_idle_animation():
	var anim := ""

	if abs(velocity.x) > abs(velocity.y):
		anim = "right_idle"
	elif velocity.y > 0:
		anim = "down_idle"
	else:
		anim = "up_idle"

	_play_animation(anim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
		_play_walk_animation()
	else:
		_play_idle_animation()

		
	move_and_slide()
