extends Area

func _ready():
	pass 

func _on_badSpeed_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		print("speed_lose")
		GlobalSignals.emit_signal("bed_speed")
