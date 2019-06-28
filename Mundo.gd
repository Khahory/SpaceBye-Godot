extends Node
export (PackedScene) var Roca
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($Posicion_inicio_player.position)
	$Inicio_timer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(Score)
	$AudioFondo.play()

#cuando acabe el juego
func game_over():
	$Score_timer.stop()
	$Roca_timer.stop()
	$Interfaz.game_over()
	$AudioMuerte.play()
	$AudioFondo.stop()

#cuando inicie el juego ()
func _on_Inicio_timer_timeout():
	$Score_timer.start()
	$Roca_timer.start()

#el timer del score es 1 segundo, que pasara cuando pase un segundo
func _on_Score_timer_timeout():
	Score += 1 #se sumara un punto cada segundo
	$Interfaz.update_score(Score)

#cuando el timer de la roca acabe, que pasara? esto (el timer de la roca es 0.5 segundos)
func _on_Roca_timer_timeout():
	#seleccionar lugar rando del camino o paht
	$Camino/RocaPosicion.set_offset(randi())
	
	#dar posicion y rotacion cada vez que se crean una roca
	var R = Roca.instance()
	add_child(R)
	
	var D = $Camino/RocaPosicion.rotation + PI/2
	R.position = $Camino/RocaPosicion.position
	
	#para que las rocas tambien salgan de forma diagonal
	D += rand_range(-PI/4, PI/4)
	R.rotation = D
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max), 0).rotated(D))
	
	
	
	
	
	