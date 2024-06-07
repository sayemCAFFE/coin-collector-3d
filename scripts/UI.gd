extends Control

var score = 0

func _ready():
	GlobalSignals.connect("score_change", self, "_score_change")
	GlobalSignals.connect("most_score", self, "_most_score")
	GlobalSignals.connect("lose_score", self ,"_lose_score")
	$scoreLabel.text = "Score :"+str(score)

func _score_change():
	score += 1
	$scoreLabel.text = "Score :"+str(score)

func _most_score():
	score += 5
	$scoreLabel.text = "Score :"+str(score)

func _lose_score():
	score -= 5
	$scoreLabel.text = "Score :"+str(score)
