extends CharacterBody3D
class_name Enemy
@onready var player = $"../Player"
const SPEED = 5
const LOCK_X: float = 17
const LOCK_Z: float = 9.3

var direction = 1
var randX = randi_range(-30,30)
var randZ = randi_range(-30,30)



func _physics_process(_delta):
	
	direction = ((player.global_position) - global_position).normalized()
	# + Vector3(randX,0,randZ)
	
	velocity = direction * SPEED
	look_at(player.position,Vector3.UP) 
	

	
	
	
	
	
	
	
	
	move_and_slide()
	position.x = clampf(position.x,-LOCK_X,LOCK_X)
	position.z = clampf(position.z,-LOCK_Z -1 ,LOCK_Z)
