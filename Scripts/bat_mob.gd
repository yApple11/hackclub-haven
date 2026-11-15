extends RigidBody2D

@export var start_position: Vector2 = Vector2(-94, -96)
@export var speed: float = 50.0
@onready var timer: Timer = $Timer

var direction := 1

func _ready() -> void:
	gravity_scale = 0
	lock_rotation = true
	global_position = start_position
	timer.timeout.connect(_on_timer_timeout)
	timer.start()


func _physics_process(_delta: float) -> void:
	# Move at a steady speed; direction is 1 (right) or -1 (left)
	linear_velocity = Vector2(speed * direction, 0)
	print(global_position)
	global_position.y = -97

func _on_timer_timeout():
	direction *= -1
