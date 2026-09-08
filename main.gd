extends Node2D

var score: int = 0
@onready var score_label: Label = $CanvasLayer/Label
@onready var win_label: Label = $CanvasLayer/WinLabel

func add_score(amount: int) -> void:
	score += amount
	score_label.text = "Score: " + str(score)
	
	# Check how many nodes in group "gems" or remaining Area2D gems remain.
	# We defer the check by 1 frame because queue_free() deletes the gem at the end of the frame.
	get_tree().create_timer(0.01).timeout.connect(check_win_condition)

func check_win_condition() -> void:
	# If no Area2D nodes remain in the scene, show win screen
	var remaining_gems = get_tree().get_nodes_in_group("gems")
	if remaining_gems.size() == 0:
		win_label.show()
