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
	$scoreLabel.text = "Score :"+str(score)

func _time_power():
	game_time += 10
	$timeLabel.text = "Time : "+str(game_time)

func _score_change():
	score += 1
	$scoreLabel.text = "Score :"+str(score)

func _most_score():
	score += 5
	$scoreLabel.text = "Score :"+str(score)

func _lose_score():
	score -= 5
	$scoreLabel.text = "Score :"+str(score)


func _on_gameTimer_timeout():
	game_time -= 1
	$timeLabel.text = "Time : "+str(game_time)
	if game_time == 0:
		get_tree().reload_current_scene()
