extends Node3D


var menu = preload("res://mainmenu/main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func restart():
	var m = menu.instantiate()
	get_tree().root.add_child(m) 
	queue_free()
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
