extends CharacterBody2D

@export var color: String = ""

var scatter_dir: Vector2 = Vector2.ZERO
var scatter_time := 0.0
var dead := false

func _ready():
	$dead_body.actioned.connect(_on_actioned)

func _physics_process(delta: float) -> void:
	if scatter_time > 0.0 and not dead:
		scatter_time -= delta
		velocity = scatter_dir * 400
		#print("processing")
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play(color + "_idle")
	move_and_slide()

func scatter() -> void:
	$AnimatedSprite2D.play(color + "_run")
	#print("scattering")
	
	scatter_time = 5
	
	scatter_dir = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0)
	)
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
func die() -> void:
	if dead:
		return
	
	#print("bunny is dead!")
	
	$bullet_collision.set_deferred("monitoring", false)
	$dead_body.set_deferred("monitorable", true)
	$dead_body.set_deferred("monitoring", true)
	$AnimatedSprite2D.play(color + "_idle")
	
	dead = true

func _on_actioned():
	$dead_body.monitoring = false
	
	'''
	DialogueManager.show_dialogue(
		"res://dialogue/objects.dialogue",
		"bunny_body"
	)'''

	await DialogueManager.dialogue_ended
	queue_free()
