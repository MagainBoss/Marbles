extends StaticBody2D

@export var MarbleScene: PackedScene

@export var player:int = 1
@export var count:int = 1
@export var bulletLeft:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#1st marble
	var marble = MarbleScene.instantiate()
	marble.position = $SpawnPoint.position
	marble.player = player
	add_child(marble)
	
	$SpawnTimer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Count.text =str(count)

#multiply
func _on_multi_trigger_area_entered(area):
	area.get_parent().marbleState = 1

#release
func _on_relea_trigger_area_entered(area):
	area.get_parent().marbleState = 2

#new marble
func _on_spawn_timer_timeout():
	var marble = MarbleScene.instantiate()
	marble.position = $SpawnPoint.position
	marble.player = player
	add_child(marble)
	pass


func _on_cannon_1_area_entered(area):
	var bulletPlayer = area.get_parent().player
	if bulletPlayer != player:
		area.get_parent().used = true
		queue_free()
	pass # Replace with function body.


func _on_cannon_2_area_entered(area):
	var bulletPlayer = area.get_parent().player
	if bulletPlayer != player:
		area.get_parent().used = true
		queue_free()
	pass # Replace with function body.


func _on_cannon_3_area_entered(area):
	var bulletPlayer = area.get_parent().player
	if bulletPlayer != player:
		area.get_parent().used = true
		queue_free()
	pass # Replace with function body.


func _on_cannon_4_area_entered(area):
	var bulletPlayer = area.get_parent().player
	if bulletPlayer != player:
		area.get_parent().used = true
		queue_free()
	pass # Replace with function body.
