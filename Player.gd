extends Area2D

export (int) var Velocidad
export (int) var speed = 200
var Movimiento = Vector2()
var Limite
signal golpe
var target = Vector2()
var velocity = Vector2()


func _ready():
	
	
	#no salga de la pantalla
		hide()
	 Limite = get_viewport_rect().size


#movimiento del personaje con las flechas
func _process(delta):
	Movimiento = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		$ParticulasFuego.position.y = 0
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		$ParticulasFuego.position.y = 0
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"):
			$ParticulasFuego.position.y = -10
		Movimiento.y += 1
		  
	if Input.is_action_pressed("ui_up"):
		$ParticulasFuego.position.y = 0
		Movimiento.y -= 1
	
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	
	position += Movimiento*delta
	#no salga de la pantalla
	position.x = clamp(position.x, 0, Limite.x)
	position.y = clamp(position.y, 0, Limite.y)
	
	#animando al jugador
	if Movimiento.x != 0:
		$sprite_player.animation = "lado"
		$sprite_player.flip_h = Movimiento.x < 0
		$sprite_player.flip_v = false
	elif Movimiento.y != 0:
		$sprite_player.animation = "espalda"
		$sprite_player.flip_v = Movimiento.y > 0
		
	else:
		#para que la animacion de frente vuela cuando no se mueve el player
		$sprite_player.flip_v = false
		$sprite_player.flip_h = false
		$sprite_player.animation = "frente"
		




#esta func se ejecuta cuando el player toca otro objeto	
func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true

#mostrar el player
func inicio(posicion):
	position = posicion
	show()
	$CollisionShape2D.disabled = false













