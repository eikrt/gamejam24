extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var factor = (self.position.distance_squared_to(Globals.PlayerPosition)) / 500
	if factor > 0.09:
		factor = 0.9
	self.position.x = lerpf(self.position.x, Globals.PlayerPosition.x, factor)
	self.position.z = lerpf(self.position.z, Globals.PlayerPosition.z, factor)
	
	#self.look_at(Vector3(0, 0, 0))
	rotation.y = Globals.angToPillar + PI / 2
