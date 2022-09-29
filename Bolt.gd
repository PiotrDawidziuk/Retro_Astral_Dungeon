extends KinematicBody2D

var velocity = Vector2(1,0)
var speed = 300

func _physics_process(delta):
	move_and_collide(velocity.normalized() * delta * speed)
