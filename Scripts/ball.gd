extends CharacterBody2D

@export var y_speed = -250
@export var angle =[-200,-250,250,300]
@export var drop_probability = 0.2
@export var item_scene = preload("res://Scenes/item_power_up_.tscn")
@onready var timer_item_power_up: Timer = $TimerItemPowerUP
@onready var audio_collision: AudioStreamPlayer2D = $AudioCollision


func _physics_process(delta):
	if Input.is_action_pressed("start") and !GameManager.started:
		play_game()
	
	if GameManager.started:
		var collision = move_and_collide(velocity*delta)
		
		if collision != null:
			audio_collision.play()
			velocity = velocity.bounce(collision.get_normal())
			
			#verifica se o nome do objeto colidido contém "Block"
			var collided_object = collision.get_collider()
			if "Block" in collided_object.name:
				GameManager._add_points(5)
				var destroyed : bool = collided_object._take_damage()
				if destroyed:
					spawn_item(collision.get_position())
				
				
	print(timer_item_power_up.is_stopped())
		
func play_game():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
	
func spawn_item(position_item : Vector2):
	if randf() < drop_probability:
		if timer_item_power_up.is_stopped():
			var item = item_scene.instantiate() 
			item.position = position_item
			get_parent().add_child(item)
			timer_item_power_up.start();
		
		

		
		
func reset_position():
	var player =  get_parent().get_node("Player")
	position = player.position + Vector2(0, -25)
	GameManager.started = false
	
	
