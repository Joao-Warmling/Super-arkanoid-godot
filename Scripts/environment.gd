extends Node2D

@onready var timer_reset: Timer = $TimerReset
@onready var audio_death: AudioStreamPlayer2D = $AudioDeath

func _process(delta):
	if Input.is_action_just_pressed("next_level_tests"):
		GameManager.started = false
		GameManager.change_level()

func _on_deathzone_body_entered(body):
	
	if body.name == "Ball":
		audio_death.play()
		if GameManager.lives > 1:
			GameManager.lives -= 1
			body.reset_position()
		else:
			GameManager.lives = 0 
			GameManager._update_record()
			timer_reset.start()
	else:
		body.queue_free()  #erro
		

func _on_timer_reset_timeout():
	GameManager._reset_lives()
	GameManager._reset_points()
	GameManager.started = false
	GameManager.currennt_level = 0 
	GameManager.change_level()
	#get_tree().reload_current_scene()
	
 
