extends KinematicBody2D


var speed = 2
var motion = Vector2(0,0)

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
