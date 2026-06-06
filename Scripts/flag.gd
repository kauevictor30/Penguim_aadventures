extends Area2D

func _on_body_exited(body: Node2D) -> void:
		# 1. Verifica se quem bateu na bandeira foi o jogador
	print("Algo encostou na bandeira: ", body.name)
	if body.name == "jogador":
		print("É o jogador! Chamando o grupo Telas...")
		# 2. Aciona a função 'abrir_menu' que criamos no script da Interface
		get_tree().call_group("Telas", "abrir_menu")
