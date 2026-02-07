extends CharacterBody2D

var scatter_dir: Vector2 = Vector2.ZERO
var scatter_time := 0.0

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
	
