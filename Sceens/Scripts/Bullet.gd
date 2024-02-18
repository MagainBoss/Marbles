extends RigidBody2D

@export var used:bool
@export var player:int = 0
@export var force:Vector2
var st:int

# Called when the node enters the scene tree for the first time.
func _ready():
	st = 1
	used = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match player:
		1:
			$Sprite2D.texture = load("res://Resources/MarbleRed.png")
		2:
			$Sprite2D.texture = load("res://Resources/MarbleLime.png")
		3:
			$Sprite2D.texture = load("res://Resources/MarbleYellow.png")
		4:
			$Sprite2D.texture = load("res://Resources/MarbleBlue.png")
	if used:
		queue_free()


func _integrate_forces(state):
	if st == 1:
		state.apply_impulse(force)
		st = 0
	pass
