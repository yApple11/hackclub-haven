extends RigidBody2D

@export var x_right = 15
@export var x_left = -90
@export var start_position = Vector2(-90, -96)

	
func _ready():
	gravity_scale = 0
	lock_rotation = true
	global_position = start_position
	freeze = true
	freeze_mode = FREEZE_MODE_KINEMATIC
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var movemet = 0
	if global_position.x < x_right:
		apply_central_impulse(Vector2(100,0))
		
	if global_position.x > x_left:
		apply_central_impulse(Vector2(-100,0))
	
		print(global_position)
