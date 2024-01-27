extends Control


var s = load("res://main/main.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	#s = load("res://main/main.tscn").instantiate()
	s = load("res://main/main.tscn").instantiate()
	get_tree().root.get_child(1).queue_free()
	get_tree().root.add_child(s)
	self.queue_free()
	self.visible = false

func _on_button_button_up():
	_add_a_scene_manually()
