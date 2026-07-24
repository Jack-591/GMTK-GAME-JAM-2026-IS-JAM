extends CharacterBody3D

class_name Enemy

@export var enemyResource: EnemyResource

@onready var manager: Manager = $"../Manager"
@onready var player = $"../Player"
@onready var healthBar: ProgressBar = $HealthBar/Sprite3D/SubViewport/ProgressBar
var speed 
var maxHealth 
var enemyName
var ability

const LOCK_X: float = 17
const LOCK_Z: float = 9.3

var direction = 1
var health: float

var dashRange: float = 5

var preparingDash = false
var dashing = false
var dashCoolDown = true


func _ready() -> void:
	assert(enemyResource != null,"%s at %s does not have an Enemy Resource!" % [name,get_path()])
	assert(!enemyResource.NOTCONFIGURED, "%s at %s does not have an Enemy Resource Configured!" % [name,get_path()])
	speed = enemyResource.speed
	maxHealth = enemyResource.maxHealth
	enemyName = enemyResource.name
	ability = enemyResource.ability
	health = maxHealth
	healthBar.max_value = maxHealth
	healthBar.value = health
	
	if enemyResource.ability == EnemyResource.Abilities.Dash:
		$startup.wait_time = 0.1
		$dash.wait_time = 0.5
		$cooldown.wait_time = 6
		$cooldown.start()
	print(str(EnemyResource.Names.keys()[enemyResource.name]) + " has joined the scene")
	

func _process(_delta) -> void:
	
	healthBar.value = move_toward(healthBar.value,health,10*_delta)

func _physics_process(_delta):
	direction = ((player.global_position) - global_position).normalized()
	
	if ability == EnemyResource.Abilities.Dash:
		
		if dashing:
			#velocity = direction * (speed + 25)
			velocity = -transform.basis.z * (speed + 20)
			#look_at(player.global_position,Vector3.UP)
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
	elif ability == enemyResource.Abilities.Nothing:
		direction = ((player.global_position) - global_position).normalized()
		velocity = direction * speed
		look_at(player.position,Vector3.UP) 
	
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
