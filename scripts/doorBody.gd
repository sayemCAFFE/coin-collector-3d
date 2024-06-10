extends StaticBody

var door_closed= true
var player_near = false

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("use"):
		if player_near:
			_use_door()


func _use_door():
	if door_closed:
		$"%doorAnim".play("doorAnim")
		door_closed = false
	else:
		$"%doorAnim".play("close")
		door_closed = true


func _on_doorArea_body_entered(body):
	if body.is_in_group("player"):
		player_near = true
		GlobalSignals.emit_signal("can_use", true)


func _on_doorArea_body_exited(body):
	if body.is_in_group("player"):
		player_near = false
		GlobalSignals.emit_signal("can_use", false)
