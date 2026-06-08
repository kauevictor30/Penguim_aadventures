extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -550.0

const WALL_SLIDE_SPEED = 120.0
const WALL_JUMP_VELOCITY = -500.0
const WALL_JUMP_PUSHBACK = 400.0

# NOVA VARIÁVEL: Bloqueia as setas temporariamente durante o salto na parede
var trava_controles := 0.0 

func _physics_process(delta: float) -> void:
	# 1. Gravidade e Redução da Trava
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if trava_controles > 0:
		trava_controles -= delta

	# 2. Escorregar na parede
	if is_on_wall() and not is_on_floor() and velocity.y > 0:
		velocity.y = min(velocity.y, WALL_SLIDE_SPEED)

	# 3. Pulos
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			$SfxPulo.play()
		elif is_on_wall():
			var wall_normal = get_wall_normal()
			velocity.y = WALL_JUMP_VELOCITY
			velocity.x = wall_normal.x * WALL_JUMP_PUSHBACK
			
			# O SEGREDO: Ignora as setas do teclado durante 0.2 segundos!
			trava_controles = 0.2 
			$SfxPulo.play()

	# 4. Pegar a direção das teclas
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# 5. Virar o Sprite (Espelhamento)
	if trava_controles <= 0.0:
		if direction > 0:
			anim.flip_h = false
		elif direction < 0:
			anim.flip_h = true
	else:
		# Durante a trava (o voo), o pinguim olha para onde está a ser atirado
		if velocity.x > 0:
			anim.flip_h = false
		elif velocity.x < 0:
			anim.flip_h = true
		
	# REGRA DE EXCEÇÃO DA PAREDE: Forçar olhar para a parede quando escorrega
	if is_on_wall() and not is_on_floor():
		var wall_normal = get_wall_normal()
		if wall_normal.x > 0: 
			anim.flip_h = false 
		elif wall_normal.x < 0: 
			anim.flip_h = true

	# 6. Aplicar Velocidade Horizontal (APENAS SE NÃO ESTIVER TRAVADO)
	if trava_controles <= 0.0:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	# 7. Executar o Movimento e a Física
	move_and_slide()
	
	# 8. Tocar Animações
	if is_on_wall() and not is_on_floor():
		if velocity.y > 0:
			anim.play("wall_slide")
		else:
			anim.play("wall_grab")
	elif not is_on_floor():
		if velocity.y < 0:
			anim.play("pulo")
		else:
			anim.play("cair")
	else:
		if direction != 0:
			anim.play("andar")
		else:
			anim.play("idle")
