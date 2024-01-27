extends Node3D

var goat = preload('res://characters/enemies/goat.tscn')
var rolling_rock = preload('res://characters/enemies/rollingrock.tscn')
var jump_rock = preload('res://characters/enemies/jumprock.tscn')
var eagle = preload('res://characters/enemies/eagle.tscn')
@export var Goat = true
@export var RollBoulders = false
@export var JumpBoulders = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var num = rng.randi_range(0, 2)
	
	var g
	if num == 0:
		g = goat.instantiate()
	elif num == 1 and RollBoulders:
		g = rolling_rock.instantiate()
	else:
		g = goat.instantiate()
	#g = jump_rock.instantiate()
	g = rolling_rock.instantiate()
	#if $RayCast3D.get_collision_point():
	#	g.global_position = $RayCast3D.get_collision_point()
	g.global_position = self.global_position
	g.name = "Goat"
	get_tree().get_root().add_child(g)
