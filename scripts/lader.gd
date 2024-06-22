extends Spatial


func _ready():
	pass


func _on_laderArea_body_entered(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("climbing", true)


func _on_laderArea_body_exited(body):
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("climbing", false)
