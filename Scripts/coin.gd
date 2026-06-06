extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# 1. Filtro de Segurança: Verifica se quem encostou foi o jogador
	if body.name == "jogador":
		
		# 2. Mensageria: Avisa a UI para somar os pontos
		get_tree().call_group("Interface", "atualizar_score")
		
		# 3. Destruição: Remove a moeda da tela
		queue_free()
