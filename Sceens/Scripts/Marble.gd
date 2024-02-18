extends RigidBody2D

@export var player:int = 0
@export var marbleState:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
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
	pass


func _integrate_forces(state):
	if marbleState == 1:
		$"..".count *= 2
		position=$"../SpawnPoint".position
		marbleState = 0
		state.apply_impulse(-mass*state.linear_velocity+randf()*Vector2(100,100))
	elif marbleState == 2:
		$"..".bulletLeft += $"..".count
		$"..".count = 1
		position=$"../SpawnPoint".position
		marbleState = 0
		state.apply_impulse(-mass*state.linear_velocity+randf()*Vector2(100,100))
