extends Control

var score = 0
var game_time = 60

var win = 0
var lose = 0

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
	$scoreLabel.text = "Score :"+str(score)

func _can_use(state):
	if state:
		$"%useLabel".visible = true
	else:
		$"%useLabel".visible = false

func _win():
#	win += 1
	$winLabel.text = "Win : "+str(win)

func _lose():
#	lose += 1
	$loseLabel.text = "Lose : "+str(lose)

func _time_power():
	game_time += 10
	$timeLabel.text = "Time : "+str(game_time)

func _score_change():
	score += 1
	$scoreLabel.text = "Score :"+str(score)
	if score == 20:
		GlobalSignals.emit_signal("win")

func _most_score():
	score += 5
	$scoreLabel.text = "Score :"+str(score)
	if score == 20:
		GlobalSignals.emit_signal("win")
	

func _lose_score():
	score -= 5
	$scoreLabel.text = "Score :"+str(score)


func _on_gameTimer_timeout():
	game_time -= 1
	$timeLabel.text = "Time : "+str(game_time)
	if game_time == 0:
		get_tree().change_scene("res://scene/sign.tscn")
		GlobalSignals.emit_signal("lose")
