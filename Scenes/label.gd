extends Label

# Criamos uma variável para guardar a pontuação na memória
var moedas_coletadas: int = 0

# Essa é a função exata que a Moeda está mandando o grupo executar
func atualizar_score() -> void:
	# Soma 1 na memória
	moedas_coletadas += 1
	
	# Atualiza o texto visual na tela (str transforma o número em texto)
	text = "Score: " + str(moedas_coletadas)
