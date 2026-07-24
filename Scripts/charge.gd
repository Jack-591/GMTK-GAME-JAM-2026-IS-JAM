extends CharacterBody3D

class_name charge

@export var enemyResource: EnemyResource

@onready var manager: Manager = $"../Manager"
@onready var player = $"../Player"
@onready var speed = enemyResource.speed
@onready var maxHealth = enemyResource.maxHealth

const LOCK_X: float = 17
const LOCK_Z: float = 9.3

var direction = 1
var randX = randi_range(-30,30)
var randZ = randi_range(-30,30)
var health


var dash = false


func _ready() -> void:
	health = maxHealth
	print(speed)
	print(str(EnemyResource.Names.keys()[enemyResource.name]) + " has joined the scene")


func _physics_process(_delta):
	#print(global_position.z)
	#print(player.global_position.z)
	direction = ((player.global_position) - global_position).normalized()
	
	#if dash == false:
		#velocity = direction * speed
	#else:
		#velocity = Vector3(0,0,0)
#
	#if dashCool == false and (global_position.distance_squared_to(player.global_position) < 10 or dash == true):
		#if dash == false:
			#$startup.start()
			#dash = true
		#if dashing == false:
			#velocity = direction * 20
	#else:
		#look_at(player.position,Vector3.UP) 
	
	if (global_position.distance_squared_to(player.global_position) < 10) and dash == false:
		print("dashing")
		dash = true
		velocity = direction * 20
		await get_tree().create_timer(2).timeout
		dash = false
		look_at(player.position,Vector3.UP) 
	else:
		look_at(player.position,Vector3.UP)
		velocity = direction * speed
	
	move_and_slide()
	position.x = clampf(position.x,-LOCK_X,LOCK_X)
	position.z = clampf(position.z,-LOCK_Z -1 ,LOCK_Z)
	


#func _on_startup_timeout():
	#dashing = true
	#$dash.start()
	#
	#
	#
#func _on_dash_timeout():
	#dashing = false
	#dash = false
	#dashCool = true
	#$cooldown.start()
#
#
#func _on_cooldown_timeout():
	#dashCool = false
	
