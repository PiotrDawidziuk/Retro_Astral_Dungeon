extends Node2D

var  player = preload("res://player.tscn")

func _ready():
	pass

func _input(event):
	if Input.get_action_strength("ui_cancel"):
		get_tree().reload_current_scene()


func _on_player_player_died():
	get_tree().reload_current_scene()


func _on_player_shot_fired(shots):
	if shots < 10:
		$"Label_bolt_2".hide()
	if shots <= 0:
		$"Label_bolt _1".hide()
