extends Area

func _ready():
	pass


func _on_loseScore_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("lose_score")
		print("lose_score")
		queue_free()

