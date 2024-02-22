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
	#if $"..".bulletLeft > 0:
		#var bullet = BulletScene.instantiate()
		#bullet.player = player
		#bullet.position = position+Vector2(40*cos(rotation),40*sin(rotation))
		#bullet.hp = $"..".bulletLeft
		#bullet.mass = log(bullet.hp)+1
		#bullet.force = Vector2(100*cos(rotation),100*sin(rotation))*bullet.mass
		#$"..".bulletLeft = 0
		#$"../..".add_child(bullet)

	#while $"..".bulletLeft > 0:
		#var bullet = BulletScene.instantiate()
		#bullet.player = player
		#bullet.position = position+Vector2(40*cos(rotation),40*sin(rotation))
		#bullet.hp = 1
		#bullet.mass = log(bullet.hp)+1
		#bullet.force = Vector2(100*cos(rotation),100*sin(rotation))*bullet.mass
		#$"../..".add_child(bullet)
		#$"..".bulletLeft -=1

	if rotation >= initRotation+PI/2:
		dire = -1
	elif  rotation <= initRotation:
		dire = 1
	rotate(PI/2*delta*dire)

	pass



func _on_timer_timeout():
	if $"..".bulletLeft > 0:
		var bullet = BulletScene.instantiate()
		bullet.player = player
		bullet.position = position+Vector2(40*cos(rotation),40*sin(rotation))
		bullet.hp = 1
		bullet.mass = log(bullet.hp)+1
		bullet.force = Vector2(100*cos(rotation),100*sin(rotation))*bullet.mass
		$"../..".add_child(bullet)
		$"..".bulletLeft -=1
	pass # Replace with function body.


func _on_body_entered(body):
	var bulletPlayer = body.player
	if bulletPlayer != player:
		body.hp -= 1
		get_parent().queue_free()
	pass # Replace with function body.
