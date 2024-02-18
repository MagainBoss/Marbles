extends Area2D

@export var player:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != 0:
		match player:
			1:
				$Sprite2D.texture = load("res://Resources/BlockRed.png")
			2:
				$Sprite2D.texture = load("res://Resources/BlockLime.png")
			3:
				$Sprite2D.texture = load("res://Resources/BlockYellow.png")
			4:
				$Sprite2D.texture = load("res://Resources/BlockBlue.png")
	pass


func _on_area_entered(area):
	var bulletPlayer = area.get_parent().player
	if bulletPlayer != player:
		player = bulletPlayer
		area.get_parent().used = true
	pass # Replace with function body.
