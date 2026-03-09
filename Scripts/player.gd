extends CharacterBody2D

@export var SPEED = 400
@onready var spawn_shoot_Timer = $SpawnShootTimer
@onready var audio_shoot: AudioStreamPlayer2D = $AudioShoot

var bullet_scene = preload("res://Scenes/bullet.tscn")
var max_bullet: int = 20
var current_bullet: int = 0


func _ready():
	GameManager.on_powerup.connect(spawn_bullet)

func _physics_process(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("left") and GameManager.started:
		print("esquerda")
		velocity.x -= SPEED
		
	if Input.is_action_pressed("right") and GameManager.started:
		print("direita")
		velocity.x += SPEED
		
	move_and_collide(velocity*delta)
	
func spawn_bullet():
	audio_shoot.play()
	var left_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(left_shoot_instance)
	left_shoot_instance.global_position.x = global_position.x - 35
	left_shoot_instance.global_position.y = global_position.y - 20
	
	var right_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(right_shoot_instance)
	right_shoot_instance.global_position.x = global_position.x + 35
	right_shoot_instance.global_position.y= global_position.y - 20
	
	current_bullet += 2

	if (current_bullet < max_bullet):
		spawn_shoot_Timer.start()
	else:
		spawn_shoot_Timer.stop()
		current_bullet = 0


func _on_spawn_shoot_timer_out() -> void:
	spawn_bullet()
