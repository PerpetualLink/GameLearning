extends Control

func setScore(newScore):
	$Panel/Score.text = "Score: " + str(newScore)

func _on_retry_button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
