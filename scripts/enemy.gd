extends Spatial

func _ready():
	pass 

func _on_enemy_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
		print("You Lose")
