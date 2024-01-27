extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	var dir = global_position.direction_to(Globals.GlobalPlayerPosition)
	velocity = dir * SPEED
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	#position = global_position.move_toward(Globals.PlayerPosition, delta * 10)

	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Vector3(1,0,0)
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	##var angToPillar = atan2(-0 - global_position.x, -Globals.pillarPos.z - global_position.z) + PI / 2
	#var angToPillar2 = atan2(-0 - global_position.x, -Globals.pillarPos.z - global_position.z)
	#if direction:
	#	velocity.x = -sin(angToPillar) * direction.x * SPEED
	#	velocity.z = -cos(angToPillar) * direction.x * SPEED
	#else:
	#	velocity.x = sin(angToPillar) * direction.x * SPEED
	#	velocity.z = cos(angToPillar) * direction.x * SPEED
	
	move_and_slide()
