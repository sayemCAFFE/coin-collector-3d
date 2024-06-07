extends Area

func _ready():
	pass

func _on_Mostscore_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		print("most_score")
		GlobalSignals.emit_signal("most_score")
