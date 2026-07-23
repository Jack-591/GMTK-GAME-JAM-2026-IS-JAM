extends CharacterBody3D


const SPEED = 9.0
const UP = 2
const DOWN = 4
const LOCK_X: float = 17
const LOCK_Z: float = 9.3


func _physics_process(_delta: float) -> void:
	
	var directionX := Input.get_axis("move_left", "move_right")
	var directionZ := Input.get_axis("move_forward", "move_backward")
	if directionX != 0:
		velocity.x = move_toward(velocity.x, directionX * SPEED, UP)
	else:
		velocity.x = move_toward(velocity.x, 0, DOWN)
	if directionZ != 0:
		velocity.z = move_toward(velocity.z, directionZ * SPEED, UP)
	else:
		velocity.z = move_toward(velocity.z, 0, DOWN)

	
	move_and_slide()
	position.x = clampf(position.x,-LOCK_X,LOCK_X)
	position.z = clampf(position.z,-LOCK_Z -1 ,LOCK_Z)
