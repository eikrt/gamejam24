extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 2
var onGround = false
var stunned
var offset = 0.0
var donk = Vector3()
var stunnedChange = 0
const stunnedTime = 0.1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass
func createVectorFromRadians(radius: float, polar: float, azimuth: float) -> Vector3:
	var x = radius * sin(polar) * cos(azimuth)
	var y = radius * sin(polar) * sin(azimuth)
	var z = radius * cos(polar)
	return Vector3(x, y, z)
func _physics_process(delta):
	self.name = "Player"
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta * 0.5
	else:
		$AnimatedSprite3D.play("walk_right")
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite3D.play("jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var rotation = self.position.angle_to(Vector3(0,self.position.y,0))
	var vec = createVectorFromRadians(rotation, 0, 0)
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var angToPillar = atan2(-0 - position.x, -Globals.pillarPos.z - position.z) + PI / 2
	var angToPillar2 = atan2(-0 - position.x, -Globals.pillarPos.z - position.z)
	Globals.angToPillar = angToPillar
	#self.rotation.y = sin(angToPillar)
	#$Node3D.rotation.y = angToPillar + PI / 2
	if velocity.x < 0.1 and velocity.x > -0.1:
		$AnimatedSprite3D.stop()
		#$AnimatedSprite3D.frame = 0
		
	if input_dir.x > 0:
		offset += 0.0001
	else:
		offset -= 0.0001
	if stunned:
		stunnedChange += delta
		if stunnedChange > stunnedTime:
			stunnedChange = 0
			stunned = false
			$ColorRect.visible = false
	else:
		if input_dir.x < 0:
			$AnimatedSprite3D.flip_h = true;
			
		elif input_dir.x > 0:
			$AnimatedSprite3D.flip_h = false;
			
	if direction and not stunned:
		velocity.x = -sin(angToPillar) * direction.x * SPEED
		velocity.z = -cos(angToPillar) * direction.x * SPEED
	elif stunned:
		velocity.x = -sin(angToPillar) * -32.0
		velocity.z = -cos(angToPillar) * -32.0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	donk.x = lerp(donk.x, 1.0, 0.1)
	position.z = lerp(position.z, cos(angToPillar2) * -10, 0.1);
	position.x = lerp(position.x, sin(angToPillar2) * -10, 0.1);
	Globals.PlayerPosition = self.position
	Globals.GlobalPlayerPosition = self.global_position
	Globals.CAnchorPosition = $Node3D.position
	if not onGround:
		position.y += velocity.y * 0.1
	#var collision = move_and_collide(velocity * delta)
	#if collision:
	#	var v = collision.get_normal()
	#	velocity = velocity.slide(Vector3.UP)
	move_and_slide()

func die():
	get_tree().root.get_child(1).restart()
	
func _on_area_3d_body_entered(body):
	if body.name == "Goat":
		body.queue_free()
		stunned = true
		$ColorRect.visible = true
		donk = Vector3(10,0,0)
		velocity.y += 1
	#velocity.y = 0
	#onGround = true


func _on_area_3d_area_entered(area):
	if area.name == "Goat":
		area.get_node("../").queue_free()
		stunned = true
		$ColorRect.visible = true
		donk = Vector3(10,0,0)
		velocity.y += 2
