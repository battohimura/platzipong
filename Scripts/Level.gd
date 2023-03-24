extends Node2D

var PlayerScore = 0
var OponenteScore = 0

func _ready():
	_reset_game()

func _process(delta): # Está función esta pensado para modificaciones de interfaz
	$MarcadoPlayer.text = str(PlayerScore)
	$MarcadoOponente.text = str(OponenteScore)

func _reset_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	# $Ball.reset_ball()
	$RestartTimer.start()

func _on_AreaPlayer_body_entered(body):
	if body is Ball:
		OponenteScore += 1
		_reset_game()

func _on_AreaOponente_body_entered(body):
	if body is Ball:
		PlayerScore += 1
		_reset_game()
