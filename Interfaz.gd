extends CanvasLayer

#creando senal para iniciar el juego
signal iniciar_juego

#mostrar mensaje
func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()

func game_over():
	mostrar_mensaje("Game over")
	yield($MensajeTimer, "timeout") #llamara una senal cuando muestre el mensaje de arriba
	#pasaran dos segundos
	$b_play.show()
	$Mensaje.text = "Space Bye"
	$Mensaje.show()
	
#actualizar el texto score
func update_score(puntos):
	$ScoreLabel.text = str(puntos)


func _on_MensajeTimer_timeout():
	$Mensaje.hide()

#cuando precione el botonm play
func _on_b_play_pressed():
	$b_play.hide()
	emit_signal("iniciar_juego")
