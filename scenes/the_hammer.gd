extends CharacterBody2D
@onready var the_player = $"../Ball whole"

const SPEED = 300.0

func _physics_process(delta):
	if the_player.position.y > 250:
		var direction=(the_player.position-position).normalized()
		velocity = direction * SPEED
		look_at(the_player.position)
		move_and_slide()

#I heart 40 second long tutorials
#https://www.youtube.com/watch?v=tjFQlMk4rS8
