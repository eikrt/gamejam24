extends StaticBody3D

var ledgeChange = 0
const ledgeTime = 1.0
var stepped = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if stepped:
		ledgeChange += delta
		$Good.visible = false
		$Broken.visible = true
	if ledgeChange > ledgeTime:
		queue_free()


func _on_area_3d_area_entered(area):
	pass # Replace with function body.

func _on_timer_timeout():
	queue_free()
func _on_area_3d_body_entered(body):
	print(body)
	if body.name == "Player":
		stepped = true
	
