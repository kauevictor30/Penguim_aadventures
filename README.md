# 🐧 Penguin Adventures

![Godot Engine](https://img.shields.io/badge/Godot-4.6.1-blue?logo=godotengine&logoColor=white)
![GDScript](https://img.shields.io/badge/Language-GDScript-green)
![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20PC%20%7C%20Mobile-lightgrey)

Um jogo de plataformas 2D dinâmico e fluido desenvolvido na Godot Engine 4. Este projeto foi criado com foco na prototipagem de mecânicas de movimento avançadas, *game feel* e exportação multiplataforma (HTML5 e Mobile).

## 🎮 Características do Jogo

O jogo destaca-se pelas suas mecânicas de controlo precisas e design de níveis:

* **Mecânicas de Movimento Avançadas:**
    * **Wall Slide:** O jogador desliza lentamente ao entrar em contacto com as paredes.
    * **Wall Jump:** Física ajustada com *Input Lock* para garantir saltos perfeitos e ejetar o jogador da parede sem conflito de controlos.
* **Design Visual e Sonoro:**
    * Fundo em *Parallax* infinito para criar sensação de profundidade.
    * Animações responsivas (correr, saltar, deslizar, agarrar na parede).
    * Sistema de áudio dinâmico (efeitos sonoros e banda sonora geridos via código, suportando pausas no ecrã de vitória).
* **Suporte Mobile:** Controlos de ecrã tátil integrados nativamente utilizando nós `TouchScreenButton`, permitindo jogar em dispositivos móveis sem alterar a lógica base do jogador.
* **Sistema de Jogo:** Coleta de moedas, *checkpoints* (bandeira de fim de fase) e interface de utilizador (HUD) para pontuação e menus.

## 🛠️ Tecnologias e Ferramentas

* **Motor de Jogo:** Godot 4 (Standard Edition / Sem dependência de Mono/.NET para garantir exportação Web limpa).
* **Linguagem:** GDScript.
* **Arte e Interface:** Os *assets* gráficos (personagem, cenários e botões mobile) são da biblioteca Kenney, complementados com edições de *level design* em grelha (TileMaps).

## 🚀 Como Executar o Projeto

1.  Clona este repositório para a tua máquina local:
    ```bash
    git clone [https://github.com/kauevictor30/Penguin_adventures.git](https://github.com/kauevictor30/Penguin_adventures.git)
    ```
2.  Abre a **Godot Engine 4** (versão Standard recomendada para suporte total a HTML5).
3.  Clica em "Importar" e seleciona o ficheiro `project.godot` na pasta do repositório.
4.  Abre a cena principal (`mundo.tscn`) e clica em **Play** (F5) para iniciar a aventura!

*Nota: Se quiseres testar os controlos mobile no PC, certifica-te de que a opção "Emular Toque pelo Rato" (Emulate Touch From Mouse) está ativa nas Configurações do Projeto.*

## 👨‍💻 Sobre o Autor

**Kauê Victor** Desenvolvedor Fullstack e Indie Game Developer, com base em Parnaíba, Piauí, Brasil. O meu objetivo é construir jogos e soluções digitais sólidas, visando o mercado internacional. Também sou um membro ativo no incentivo à tecnologia regional, ajudando a gerir a comunidade **Porto Indie** e a organizar o maior evento de *gamedev* do estado.

* **Instagram:** [@kauevictor.dev](https://instagram.com/kauevictor.dev)
* **Comunidade:** [Porto Indie](https://www.hopp.bio/portoindie)
