extends Area2D

@export var player:int = 1
@export var BulletScene: PackedScene

var dire:int = 1
var initRotation

# Called when the node enters the scene tree for the first time.
func _ready():
	initRotation = rotation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotation >= initRotation+PI/2+PI/16:
		dire = -1
	elif  rotation <= initRotation-PI/16:
		dire = 1
	rotate(PI/2*delta*dire)
	
	pass


func _on_timer_timeout():
	if $"..".bulletLeft > 0:
		$"..".bulletLeft -= 1
		var bullet = BulletScene.instantiate()
		bullet.player = player
		bullet.force = Vector2(200*cos(rotation),200*sin(rotation))
		bullet.position = position
		$"..".add_child(bullet)
