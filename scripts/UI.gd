extends Control

var score = 0
var game_time = 60

func _ready():
	$gameTimer.start()
	$timeLabel.text = "Time : "+str(game_time)
	GlobalSignals.connect("score_change", self, "_score_change")
	GlobalSignals.connect("most_score", self, "_most_score")
	GlobalSignals.connect("lose_score", self ,"_lose_score")
	GlobalSignals.connect("time_power", self, "_time_power")
	GlobalSignals.connect("win", self, "_win")
	GlobalSignals.connect("lose", self, "_lose")
	GlobalSignals.connect("can_use", self, "_can_use")
	GlobalSignals.connect("collected_key", self, "_collected_key")
	GlobalSignals.connect("door_locked", self, "_door_locked")
	GlobalSignals.connect("climbing", self, "_climbing")
	$winLabel.text = "win :"+str(GlobalVars.win_count)
	$loseLabel.text = "lose :"+str(GlobalVars.lose_count)
	$scoreLabel.text = "Score :"+str(score)
	$keyLabel.text = "Key : "+str(GlobalVars.key_count)

func _climbing(state):
	if state:
		$"%useLabel".visible = true
		$"%useLabel".text = "x to climb up / z to climb down"
	else:
		$"%useLabel".visible = false

func _collected_key(count):
	GlobalVars.key_count += count
	$keyLabel.text = "Key : "+str(GlobalVars.key_count)

func _door_locked():
	$"%useLabel".text = "LOCKED"
	$"%useLabel".visible = true

func _can_use(state):
	if state:
		$"%useLabel".text = "Prees e"
		$"%useLabel".visible = true
	else:
		$"%useLabel".visible = false

func _win():
	GlobalVars.win_count += 1
	$winLabel.text = "Win : "+str(GlobalVars.win_count)

func _lose():
	GlobalVars.lose_count += 1
	$loseLabel.text = "Lose : "+str(GlobalVars.lose_count)

func _time_power():
	game_time += 10
	$timeLabel.text = "Time : "+str(game_time)

func _score_change():
	score += 1
	$scoreLabel.text = "Score :"+str(score)
	if score >= 20:
		GlobalSignals.emit_signal("win")
		get_tree().reload_current_scene()

func _most_score():
	score += 5
	$scoreLabel.text = "Score :"+str(score)
	if score >= 20:
		GlobalSignals.emit_signal("win")
		get_tree().reload_current_scene()
	

func _lose_score():
	score -= 5
	$scoreLabel.text = "Score :"+str(score)


func _on_gameTimer_timeout():
	game_time -= 1
	$timeLabel.text = "Time : "+str(game_time)
	if game_time == 0:
		get_tree().change_scene("res://scene/sign.tscn")
		GlobalSignals.emit_signal("lose")
