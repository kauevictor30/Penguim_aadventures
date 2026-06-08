extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# 1. Filtro de Segurança: Verifica se quem encostou foi o jogador
	if body.name == "jogador":
		
		# 2. Mensageria: Avisa a UI para somar os pontos
		get_tree().call_group("Interface", "atualizar_score")
		
		# 3. Ilusão de coleta: Esconde a moeda e desativa a colisão para não pontuar duplo
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
		
		# 4. Áudio: Toca o som e espera ele terminar ANTES de destruir o nó
		$SfxMoeda.play()
		await $SfxMoeda.finished
		queue_free()
