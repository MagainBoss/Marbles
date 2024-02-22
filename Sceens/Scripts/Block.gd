extends Area2D

@export var player:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	var bullet = body
	if bullet.hp > 0:
		var bulletPlayer = bullet.player
		if bulletPlayer != player:
			player = bulletPlayer
			bullet.hp -= 1
			match player:
				1:
					$Sprite2D.texture = load("res://Resources/BlockRed.png")
				2:
					$Sprite2D.texture = load("res://Resources/BlockLime.png")
				3:
					$Sprite2D.texture = load("res://Resources/BlockYellow.png")
				4:
					$Sprite2D.texture = load("res://Resources/BlockBlue.png")
	pass # Replace with function body.
