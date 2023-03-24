extends KinematicBody2D
class_name Ball

var speed = 0
var direction = Vector2.ZERO
var is_moving = false
onready var timer = get_parent().find_node("RestartTimer")

func _ready():
	randomize() # inicializador de la funcion random, sin esta linea la función randi() no funciona
	reset_ball()
	
func _physics_process(delta): # delta sirve para saber el porcentaje de tiempo que pasa entre 1 frame y otro
	if is_moving:
		var collide = move_and_collide(direction * speed * delta) # collide devuleve el objeto con el que choca la pelota

		if collide:
			$AudioCollision.play()
			direction = direction.bounce(collide.normal) # bounce es rebote. normal = dirección opuesta del objeto con el que choca

func reset_ball():
	timer.stop()
	speed = 600
	direction.x = [-1, 1][randi() % 2] # muevo de forma aleatoria la pelota, -1 va hacia el player 1 va hacia el oponente
	direction.y = [-0.8, 0.8][randi() % 2] # muevo de forma aleatoria la pelota en diagnoal
	is_moving = true


func _on_RestartTimer_timeout():
	reset_ball()
