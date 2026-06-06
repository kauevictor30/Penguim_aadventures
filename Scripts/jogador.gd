extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -550.0

func _physics_process(delta: float) -> void:
	# 1. Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 2. Pulo
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 3. Pegar a direção (Inputs)
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# 4. Virar o Sprite (Espelhamento)
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
		anim.flip_h = true
	
	# 5. Aplicar Velocidade Horizontal
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# 6. Executar o Movimento e a Física (Apenas um Tab de recuo)
	move_and_slide()
	
	# 7. Tocar as Animações Corretas (Apenas um Tab de recuo)
	if not is_on_floor():
		if velocity.y < 0:
			anim.play("pulo")
		else:
			anim.play("cair")
	else:
		if direction != 0:
			anim.play("andar")
		else:
			anim.play("idle")
