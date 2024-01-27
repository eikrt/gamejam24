extends CharacterBody3D


const SPEED = 4.0
const JUMP_VELOCITY = 4.5
var dir
var change = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	dir = global_position.direction_to(Globals.GlobalPlayerPosition)
	
func _physics_process(delta):
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	change += PI / 100
	velocity = dir * SPEED
	velocity.x = dir.x * SPEED 
	velocity.z = dir.z * SPEED
	velocity.y += sin(change) * 2.5


	move_and_slide()
