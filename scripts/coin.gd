extends Area

func _ready():
	pass

func _on_coin_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		GlobalSignals.emit_signal("score_change")
		print("coin_collected")
