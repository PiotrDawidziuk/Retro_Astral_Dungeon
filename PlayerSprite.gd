extends Sprite

const SPRITES_MAP := {
	Vector2.RIGHT: preload("res://art/player_right_crossbow.png"),
	Vector2.LEFT: preload("res://art/player_right_crossbow.png")
}

var faces_right = true

func _process(_delta : float) -> void:
	if faces_right and Input.is_action_pressed("ui_left"):
		flip_h 
