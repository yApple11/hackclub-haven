extends RigidBody2D

@export var movemement_speed := 300.0     # sideways push from left/right input
@export var max_speed := 150.0      # stop pushing once moving this fast
@export var jump_impulse := 200.0



func _ready() -> void:
	# Needed so get_contact_count() works (to know if we're touching the floor)
	contact_monitor = true
	max_contacts_reported = 4


func _physics_process(_delta: float) -> void:
	print(Input.is_action_pressed("ui_right"))
	# Left/right: push the ball with a force; physics handles the movement and bouncing
	
	var right := Vector2(300, 0)
	var left := Vector2(-300,0)
		
	if Input.is_action_pressed("ui_left"):
		apply_central_force(left)
		
	if Input.is_action_pressed("ui_right"):
		apply_central_force(right)
	

		
	
	
	# Jump: only when touching something
	if Input.is_action_just_pressed("ui_accept") and get_contact_count() > 0:
		apply_central_impulse(Vector2(0, -jump_impulse))
