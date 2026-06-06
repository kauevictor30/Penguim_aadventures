extends CanvasLayer

func _ready() -> void:
	# Por precaução, garante que o menu nasça invisível
	hide()

# Essa é a função que o seu Portal vai chamar!
func abrir_menu() -> void:
	show() # Fica visível
	get_tree().paused = true # Pausa o jogo

# Funcionalidade do botão de recomeçar
func _on_btn_reiniciar_pressed() -> void:
	get_tree().paused = false # Despausa o jogo
	get_tree().reload_current_scene() # Reinicia a fase atual

# Funcionalidade do botão de avançar
func _on_btn_proxima_pressed() -> void:
	get_tree().paused = false
	# Lembre-se de trocar o caminho abaixo para o nome real da sua fase 2!
	get_tree().change_scene_to_file("res://mundo_2.tscn")
