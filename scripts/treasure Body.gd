extends StaticBody

var treasure_closed = true
var player_near = false

export var locked = true

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("use"):
		if player_near:
			if locked:
				_check_key()
			else:
				_use_door()

func _check_key():
	if GlobalVars.key_count > 0:
		locked = false
		GlobalSignals.emit_signal("collected_key", -1)
		_use_door()
	else:
		GlobalSignals.emit_signal("door_locked")

func _use_door():
	if treasure_closed:
		$"%doorAnim".play("doorAnim")
		treasure_closed = false
	else:
		$"%doorAnim".play("close")
		treasure_closed = true


func _on_doorArea_body_entered(body):
	if body.is_in_group("player"):
		player_near = true
		GlobalSignals.emit_signal("can_use", true)


func _on_doorArea_body_exited(body):
	if body.is_in_group("player"):
		player_near = false
		GlobalSignals.emit_signal("can_use", false)
