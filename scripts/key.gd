extends Area


func _ready():
	pass


func _on_key_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("collected_key", 1)
		queue_free()
