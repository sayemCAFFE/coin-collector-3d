extends Spatial

func _ready():
	pass


func _on_Area_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("lose")
		get_tree().change_scene("res://scene/sign.tscn")
