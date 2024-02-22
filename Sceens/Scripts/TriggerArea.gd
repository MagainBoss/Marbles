extends StaticBody2D

@export var MarbleScene: PackedScene

@export var player:int = 1
@export var count:int = 1
@export var bulletLeft:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#3 marbles
	for i in range(3):
		var marble = MarbleScene.instantiate()
		marble.position = $SpawnPoint.position
		marble.player = player
		add_child(marble)

	$SpawnTimer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Count.text =str(bulletLeft)


#new marble
func _on_spawn_timer_timeout():
	#var marble = MarbleScene.instantiate()
	#marble.position = $SpawnPoint.position
	#marble.player = player
	#add_child(marble)
	pass


func _on_multi_trigger_body_entered(body):
	body.marbleState = 1
	pass # Replace with function body.


func _on_relea_trigger_body_entered(body):
	body.marbleState = 2
	pass # Replace with function body.
