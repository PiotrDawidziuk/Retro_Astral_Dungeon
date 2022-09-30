extends KinematicBody2D

const venom_path = preload("res://Snake_venom.tscn")
var speed = 2
var motion = Vector2(0,0)
var _timer = null
var direction =  1

func _physics_process(delta):

	motion.y += speed * direction
	
	move_and_slide(motion)

func handle_hit():
	print("snake hit")
	queue_free()


func _on_SnakeArea2D_body_entered(body):
	direction = direction * -1

	if body.has_method("die"):
		 body.die()
	

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.5)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	shoot()
		
func shoot ():
	var venom = venom_path.instance()
	get_parent().add_child(venom)
	#if (faces_right):
	#	bolt.position = $aim_right.global_position
	#else: 
	venom.position = $aim_left.global_position
	venom.velocity = Vector2(-1,0)
	
	yield(get_tree().create_timer(1), "timeout")
	if venom != null and is_instance_valid(venom):
		venom.queue_free()
