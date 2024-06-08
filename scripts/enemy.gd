extends Spatial

func _ready():
	pass 

func _on_enemy_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("lose")
		get_tree().change_scene("res://scene/sign.tscn")
		print("You Lose")
