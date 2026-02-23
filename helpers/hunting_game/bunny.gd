extends CharacterBody2D

var scatter_dir: Vector2 = Vector2.ZERO
var scatter_time := 0.0
var dead := false
@export var color: String

func _physics_process(delta: float) -> void:
	if scatter_time > 0.0:
		scatter_time -= delta
		velocity = scatter_dir * 120
	else:
		velocity = Vector2.ZERO
		move_and_slide()

func scatter() -> void:
	scatter_dir = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-0.5, 0.5)
	).normalized()
	
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
