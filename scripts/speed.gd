extends Area

func _ready():
	pass

func _on_speed_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("speed_power")
		queue_free()
		print("speed_change")
