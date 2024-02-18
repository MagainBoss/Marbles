extends Node2D

@export var blockScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	#490,10
	for x in range(48):
		for y in range(54):
			var block = blockScene.instantiate()
			block.position = Vector2(490+20*x,10+20*y)
			add_child(block)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
