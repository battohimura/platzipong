extends KinematicBody2D

var speed = 600
onready var ball = get_parent().find_node("Ball") # En lugar de colocar todo lo que sigue del = en la funcion _ready

func _physics_process(delta):
	if ball.position.x > 890:
		var direction = Vector2(0, _get_direction())
		move_and_slide(direction * speed)

func _get_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		return -1
	else:
		return 0
