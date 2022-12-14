extends KinematicBody2D

var velocity = Vector2(-1,0)
var speed = 200

func _physics_process(delta):
	move_and_collide(velocity.normalized() * delta * speed)



func _on_Area2D_body_entered(body):
	if body.has_method("die"):
		body.die()
	
	queue_free()
