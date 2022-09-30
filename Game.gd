extends Node2D

var  player = preload("res://player.tscn")

func _ready():
	
	if Globals.is_player_alive == false:
		get_tree().reload_current_scene()
func _input(event):
	if Input.get_action_strength("ui_cancel"):
		get_tree().reload_current_scene()


func _on_player_player_died():
	get_tree().reload_current_scene()
