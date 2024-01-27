extends StaticBody3D

var ledgeChange = 0
@export var ledgeTime = 0.001
var stepped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if stepped:
		ledgeChange += delta
	if ledgeChange > ledgeTime:
		$AnimationPlayer.play("new_animation")
		position.y -= 0.1


func _on_area_3d_area_entered(area):
	print(area)
	if area.name == "Player":
		stepped = true

func _on_timer_timeout():
	queue_free()
func _on_area_3d_body_entered(body):
	if body.name == "Player":
		stepped = true
	
