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
var health: float

var dashSpeed: float = 20
var dashRange: float = 10

var preparingDash = false
var dashing = false
var dashCoolDown = false


func _ready() -> void:
	health = maxHealth
	print(speed)
	print(str(EnemyResource.Names.keys()[enemyResource.name]) + " has joined the scene")


func _physics_process(_delta):
	#print(global_position.z)
	#print(player.global_position.z)
	direction = ((player.global_position) - global_position).normalized()
	
	if dashing:
		velocity = direction * 20
		look_at(player.global_position,Vector3.UP)
	elif preparingDash:
		velocity = Vector3.ZERO
	else:
		velocity = direction * speed
		
		if not dashCoolDown:
			var distance = global_position.distance_squared_to(player.global_position)
			
			if distance < dashRange * dashRange:
				print("starting to dash")
				startDash()
	if not preparingDash and not dashing:
		look_at(player.global_position,Vector3.UP)
	
	
	move_and_slide()
	position.x = clampf(position.x,-LOCK_X,LOCK_X)
	position.z = clampf(position.z,-LOCK_Z -1 ,LOCK_Z)
	

func startDash() -> void:
	preparingDash = true
	velocity = Vector3.ZERO
	$startup.start()

func _on_startup_timeout():
	preparingDash = false
	dashing = true
	$dash.start()
	
	
	
func _on_dash_timeout():
	dashing = false
	dashCoolDown = true
	$cooldown.start()


func _on_cooldown_timeout():
	dashCoolDown = false
	
