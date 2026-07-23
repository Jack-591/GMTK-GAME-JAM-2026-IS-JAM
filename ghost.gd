extends CharacterBody3D
@onready var player = $"../Player"
const SPEED = 5
var direction = 1
var randX = randi_range(-30,30)
var randZ = randi_range(-30,30)



func _physics_process(_delta):
	
	direction = ((player.global_position) - global_position).normalized()
	# + Vector3(randX,0,randZ)
	
	velocity = direction * SPEED
	
	

		
		
		
		
		
		
		
		
	move_and_slide()
