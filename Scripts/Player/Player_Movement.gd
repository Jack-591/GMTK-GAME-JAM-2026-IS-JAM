extends CharacterBody3D

const UP = 2
const DOWN = 4
const LOCK_X: float = 17
const LOCK_Z: float = 9.3
const MAX_HEALTH = 100
@onready var playerModel = $MainCharacter
var speed = 9.0
var thingx = 0
var thingz = 0

func _physics_process(_delta: float) -> void:
	var inputDirection = Input.get_vector("left","right","up","down")
	
	var moveDir = Vector3(inputDirection.x,0,inputDirection.y)
	
	
	if moveDir.x != 0.0:
		velocity.x = move_toward(
			velocity.x,
			moveDir.x * speed,
			UP
		)
	else:
		velocity.x = move_toward(velocity.x, 0.0, DOWN)

	if moveDir.z != 0.0:
		velocity.z = move_toward(
			velocity.z,
			moveDir.z * speed,
			UP
		)
	else:
		velocity.z = move_toward(velocity.z, 0.0, DOWN)
	if moveDir != Vector3.ZERO:
		var target_rotation := atan2(-moveDir.x, -moveDir.z)
		playerModel.rotation.y = lerp_angle(playerModel.rotation.y,target_rotation,clampf(10 * _delta, 0.0, 1.0))
		
	move_and_slide()
	position.x = clampf(position.x,-LOCK_X,LOCK_X)
	position.z = clampf(position.z,-LOCK_Z -1 ,LOCK_Z)
