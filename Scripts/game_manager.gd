extends Node

var started:bool = false
var lives: int = 3

var points: int = 0
var record: int = 0

var currennt_level = 1 
var total_levels = 3

signal on_powerup

func _add_points(value):
	points += value
	
func _reset_points():
	points = 0
	
func _update_record():
	if points > record:
		record = points 
		
func _reset_lives():
	lives = 3

func change_level():
	if currennt_level < total_levels:
		currennt_level += 1 
		var scene_directory = "res://Scenes/level_" + str(currennt_level) + ".tscn"
		get_tree().change_scene_to_file(scene_directory)
	else:
		print("Você venceu o  jogo!")
		
