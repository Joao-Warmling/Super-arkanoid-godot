extends Area2D

@export var speed = 250

func _physics_process(delta):
	global_position.y -= speed*delta





func _on_body_entered(body):
	GameManager._add_points(1)
	queue_free()        # destrói a bala
	body._take_damage()
