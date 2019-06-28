extends RigidBody2D
export (int) var velocidad_min
export (int) var velocidad_max

#arreglos multiple sprites
var tipo_roca = ["grande", "chiquito"]

func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	
	#cuando el sprite sea de la animacion(grande)
	if $AnimatedSprite.animation == "grande":
		$AnimatedSprite.scale.x = 0.3
		$AnimatedSprite.scale.y = 0.3
		$CollisionShape2D.scale.x = 1.9
		$CollisionShape2D.scale.y = 1.9



func _on_VisibilityNotifier2D_screen_exited():
	#eliminar roca
	queue_free()
