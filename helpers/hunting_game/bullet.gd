extends Area2D

@export var speed := 3000.0
@export var damage := 40
var direction := Vector2.RIGHT

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group("bunnies"):
		#print("bunny killed")
		body.die() 
	elif body.is_in_group("world_bounds"):
		print("body entered")
	else:
		print(
		"Body:", body.name,
		"| Groups:", body.get_groups()
		)
	queue_free()
