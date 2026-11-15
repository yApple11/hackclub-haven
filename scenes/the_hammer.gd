extends CharacterBody2D
@onready var the_player = $"../Ball whole"

const SPEED = 150.0



func _physics_process(delta):
	if the_player.position.y > 250 && the_player.position >2060 && the_player.position <3312:
		var direction=(the_player.position-position).normalized()
		velocity = direction * SPEED
		move_and_slide()

#I heart 40 second long tutorials
#https://www.youtube.com/watch?v=tjFQlMk4rS8
