extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var actionable_finder: Area2D = $Direction/ActionableFinder



var current_anim: String = ""
var last_dir := Vector2.DOWN
var facing_right := true

func _play_animation(anim_name: String):
	if anim_name == "" or current_anim == anim_name:
		return

	current_anim = anim_name
	anim_player.play(anim_name)

func _play_walk_animation():
	var anim := ""

	if velocity.x > 0:
		anim = "right_walk"
		facing_right = true
	elif velocity.x < 0:
		anim = "left_walk"
		facing_right = false
	elif velocity.y > 0:
		anim = "down_walk"
	elif velocity.y < 0:
		anim = "up_walk"

	last_dir = velocity
	#print(last_dir)

	_play_animation(anim)

func _play_idle_animation():
	var anim := ""

	if abs(last_dir.x) > abs(last_dir.y):
		if facing_right:
			anim = "right_idle"
		else:
			anim = "left_idle"
		
	elif last_dir.y > 0:
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
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
		#DialogueManager.show_example_dialogue_balloon(load("res://dialogue/first_meeting.dialogue"), "start")
		return
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
		_play_walk_animation()
	else:
		_play_idle_animation()

		
	move_and_slide() # god it topok me way to long to figure this last partt out 
