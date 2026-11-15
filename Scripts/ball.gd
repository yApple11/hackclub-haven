extends RigidBody2D

@export var respawn_point = Vector2(-5,9)

var respawn := false



func _ready() -> void: #Function to initialize things for the begginnign
	contact_monitor = true
	max_contacts_reported = 2
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node) -> void: #Is it touching an emey?
	if body.is_in_group("enemey"):
		respawn = true

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void: #Respawn when it's touching an eenemy
	if respawn:
		state.transform.origin = respawn_point
		state.linear_velocity = Vector2.ZERO
		state.angular_velocity = 0.0
		respawn = false
func _physics_process(_delta: float) -> void:	
	
	var right := Vector2(10, 0)
	var left := Vector2(-10,0)
		
	if Input.is_action_pressed("ui_left"):
		apply_central_impulse(left)
		
	if Input.is_action_pressed("ui_right"):
		apply_central_impulse(right)
		
	# Jump: only when touching something
	if Input.is_action_just_pressed("ui_accept") and get_contact_count() > 0:
		apply_central_impulse(Vector2(0, -400))
		
	print("ball position ", global_position)
		

	
