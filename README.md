# Projeto App Quiz - UNIFASAR 📱

Um aplicativo de perguntas e respostas (Quiz) interativo desenvolvido em **Flutter** e **Dart**. Este projeto foi criado como parte das atividades da disciplina de Desenvolvimento de Aplicações Móveis e Distribuídas do Centro Universitário Santa Rita (UNIFASAR).

## 🚀 Funcionalidades

O aplicativo foi aprimorado com diversas funcionalidades que garantem uma experiência dinâmica e responsiva:

* **Tela de Boas-Vindas:** Interface inicial com a logo da instituição e botão de início.
* **Perguntas Dinâmicas:** Questionário focado em conceitos de programação com Dart e Flutter.
* **Timer Integrado:** Cada pergunta possui um limite de 30 segundos para ser respondida.
* **Barra de Progresso (LinearProgressIndicator):** Feedback visual em tempo real do tempo restante.
* **Feedback Visual de Respostas:** Ao clicar em uma alternativa, o aplicativo revela o gabarito instantaneamente (Verde para a correta, Vermelho para o erro e Cinza para as demais) com uma pausa dramática antes de avançar.
* **Tela de Resultados:** Exibe a pontuação final do usuário baseada na quantidade de acertos, com frases de encorajamento e opção de reiniciar o teste.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Dart (com implementação de Null Safety)
* **Framework:** Flutter
* **Gerenciamento de Estado:** StatefulWidget (para controle de tempo, pontuação e atualização de interface)

## 🏗️ Arquitetura e Árvore de Widgets

Abaixo está o diagrama hierárquico estrutural do aplicativo, detalhando a separação entre os widgets nativos do Flutter e as classes customizadas (Stateless e Stateful Widgets) desenvolvidas para o projeto:

![Diagrama de Widgets da Aplicação](Diagrama%20Widgets.png)

## 💻 Estrutura de Arquivos Principais

O código-fonte está organizado na pasta `lib/` da seguinte maneira:

* `main.dart`: Arquivo principal que gerencia o estado da aplicação (StatefulWidget), o cronômetro e a lógica de transição de telas.
* `tela_inicial.dart`: Estrutura visual da tela de boas-vindas.
* `questionario.dart`: Responsável por agrupar a pergunta e gerar dinamicamente os botões de resposta usando `.map()`.
* `questao.dart`: Renderiza o texto e a imagem do enunciado.
* `resposta.dart`: Botão customizado que recebe as funções de clique e as atualizações de cores do feedback visual.
* `resultado.dart`: Tela final que calcula e exibe o desempenho do jogador.
