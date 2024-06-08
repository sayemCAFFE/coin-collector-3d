extends Node2D

var game_start = 5

func _ready():
	$timelabel.text = ""+str(game_start)
	$Timer.start()


func _on_Timer_timeout():
	game_start -= 1
	$timelabel.text = ""+str(game_start)
	if game_start == 0:
		get_tree().change_scene("res://scene/main_scene.tscn")
