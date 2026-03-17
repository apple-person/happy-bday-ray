extends CharacterBody2D

var scatter_dir: Vector2 = Vector2.ZERO
var scatter_time := 0.0
var idle_time := randf_range(0, .5)

var dead := false
var panic := false
@export var color: String

func _physics_process(delta: float):		
	if scatter_time > 0.0 and not dead:
		scatter_time -= delta
		velocity = scatter_dir * 120
	elif idle_time > 0:
		idle_time -= delta
		velocity = Vector2.ZERO
	else: 
		_randomize_action()
	
	move_and_slide()
	
	$AnimatedSprite2D.flip_h = velocity.x > 0

func scatter(p: bool):
	panic = p 
	$AnimatedSprite2D.play(color + "_run")
	_generate_speed()

func _generate_speed():
	if panic:
		scatter_dir = Vector2(
			randf_range(-2.0, 2.0),
			randf_range(-0.5, 0.5)
		).normalized()
	else:
		scatter_dir = Vector2(
			randf_range(-2.0, 2.0),
			randf_range(-0.5, 0.5)
		).normalized()

func _randomize_action():
	if randi_range(0,1) == 0:
		#print(color + "_idle")
		$AnimatedSprite2D.play(color + "_idle")
		idle_time = randf_range(1.0, 3.0)
	else:
		scatter_time = randf_range(1.0, 2.0)
		scatter(false)

func die():
	if dead:
		return
		
	#print("bunny is dead!")
	$dead_body.set_deferred("monitorable", true)
	$dead_body.set_deferred("monitoring", true)
	$AnimatedSprite2D.play(color + "_idle")
	
	dead = true

func _on_actioned():
	$dead_body.monitoring = false
	await DialogueManager.dialogue_ended
	queue_free()
