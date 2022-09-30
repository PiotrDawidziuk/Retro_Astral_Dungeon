extends KinematicBody2D

export var speed := 50.0
var faces_right = true
const bolt_path = preload("res://Bolt.tscn")
var is_player_alive = true

func _physics_process(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	var move_direction := input_vector.normalized()
	move_and_slide(speed * move_direction)

func _process(_delta : float) -> void:

	if faces_right and Input.is_action_pressed("ui_left"):
		get_node("PlayerSprite").set_flip_h(true) 
		faces_right = false
	if faces_right == false and Input.is_action_pressed("ui_right"):
		get_node("PlayerSprite").set_flip_h(false) 
		faces_right = true
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		
func shoot ():
	var bolt = bolt_path.instance()
	get_parent().add_child(bolt)
	if (faces_right):
		bolt.position = $aim_right.global_position
	else: 
		bolt.position = $aim_left.global_position
		bolt.velocity = Vector2(-1,0)

	yield(get_tree().create_timer(0.5), "timeout")
	if bolt != null and is_instance_valid(bolt):
		bolt.queue_free()
func die():
	Globals.is_player_alive = false	
	print("ded")
	get_parent().get_tree().reload_current_scene()
