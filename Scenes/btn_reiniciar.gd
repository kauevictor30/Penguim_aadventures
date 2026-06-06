extends Button

func _on_pressed() -> void:
	# 1. Despausa o jogo ANTES de reiniciar
	get_tree().paused = false
	
	# 2. Recarrega a cena atual do zero
	get_tree().reload_current_scene()
