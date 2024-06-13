extends Spatial

func _ready():
	pass


func _on_timePower_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("lose")
		queue_free()
