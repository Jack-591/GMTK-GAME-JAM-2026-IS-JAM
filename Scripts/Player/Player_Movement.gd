extends CharacterBody3D


var SPEED = 9.0
const UP = 2
const DOWN = 4
const LOCK_X: float = 17
const LOCK_Z: float = 9.3
var thingx = 0
var thingz = 0

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("left"):
		thingx = 1
	elif Input.is_action_pressed("right"):
		thingx = 1
	else:
		thingx = 0
	if Input.is_action_pressed("up"):
		thingz = 1
	elif Input.is_action_pressed("down"):
		thingz = 1
	else:
		thingz = 0
		
	if thingx == 1 and thingz == 1:
		SPEED = 6.36
	else:
		SPEED = 9
	
	
	
	var directionX := Input.get_axis("left", "right")
	var directionZ := Input.get_axis("up", "down")
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
