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
var health = maxHealth


var dash = false
var dashing = false
var saul = "left"
var dashCool = false

func _ready() -> void:
	print(speed)
	print(str(EnemyResource.Names.keys()[enemyResource.name]) + " has joined the scene")


func _physics_process(_delta):
	#print(global_position.z)
	#print(player.global_position.z)
	direction = ((player.global_position) - global_position).normalized()
	
	if dash == false:
		velocity = direction * speed
	else:
		velocity = Vector3(0,0,0)
	
	if dashCool == false and (global_position.z < player.global_position.z + 3 and global_position.z > player.global_position.z - 3 or dash == true):
		if dash == false:
			$startup.start()
			dash = true
		if dashing == false:
			if global_position.x > player.global_position.x:
				#rotation.y = 180
				look_at(player.position,Vector3.UP) 
				saul = "left"
			else:
				#rotation.y = 0
				saul = "right"
				look_at(player.position,Vector3.UP) 
		else:
			
			if saul == "right":
				velocity.x = 15
			else:
				velocity.x = -15
	else:
		look_at(player.position,Vector3.UP) 
	
	
	
	
	move_and_slide()
	position.x = clampf(position.x,-LOCK_X,LOCK_X)
	position.z = clampf(position.z,-LOCK_Z -1 ,LOCK_Z)
	


func _on_startup_timeout():
	dashing = true
	$dash.start()
	
	
	
func _on_dash_timeout():
	dashing = false
	dash = false
	dashCool = true
	$cooldown.start()


func _on_cooldown_timeout():
	dashCool = false
	
