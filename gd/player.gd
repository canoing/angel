extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const  max_agle = 2
const min_agle = 0

var rota = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	var salto = Input.is_action_just_pressed("ui_accept")
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if salto :
		velocity.y = JUMP_VELOCITY
		
		rotation = 0
		
		rota = false
	elif Input.is_action_just_released("ui_accept"):
		rota = true
	if rota and rotation < max_agle:
		rotation += 0.05
	
	
		
	
	velocity.x = SPEED
	

	move_and_slide()
