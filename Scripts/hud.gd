extends Control

@onready var label_points: Label = $LabelPoints
@onready var label_record: Label = $LabelRecord
@onready var label_lives: Label = $LabelLives

func _process(delta):
	label_points.text = "Pontos:" + str(GameManager.points)
	label_record.text = "Record:" + str(GameManager.record)
	label_lives.text = "Vidas:" + str(GameManager.lives)
