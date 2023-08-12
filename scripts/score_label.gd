extends Label

func _process(delta):
	text = 'Score: ' + str((get_node('/root/ScoreCounter') as ScoreCounter).total_score)
