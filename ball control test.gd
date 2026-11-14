extends RigidBody2D

@export var push_force := 800.0


func _physics_process(_delta):
	var dir := Input.get_axis("ui_left", "ui_right")
	print(dir)
	apply_central_force(Vector2(dir * push_force, 0))
