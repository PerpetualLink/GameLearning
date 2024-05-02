extends Node

var hurt = preload("res://Martian Mike/assets/audio/hurt.wav")
var jump = preload("res://Martian Mike/assets/audio/jump.wav")

func play_sfx(sfx_name: String):	
	var stream = null
	
	if sfx_name == "hurt":
		stream = hurt
	elif sfx_name == "jump":
		stream = jump
	else:
		print("Invalid sfx name")
		return
		
	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	asp.volume_db = -11
	
	add_child(asp)
	asp.play()
	
	await asp.finished
	asp.queue_free()
