import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_quiz/questionario.dart';
import 'package:projeto_quiz/resultado.dart';
import 'package:projeto_quiz/telaInicial.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var nota_total = 0;

  bool _jogoIniciado = false;
  int _tempoRestante = 30;
  Timer? _timer;

  bool _mostrandoGabarito = false;
  int? _indiceEscolhido;

  final perguntas = const[
    {
      'pergunta': 'Qual é a função obrigatória que serve como ponto de entrada para iniciar qualquer aplicativo Dart?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'void start()', 'nota': 0},
        {'texto': 'void main()', 'nota': 1}, 
        {'texto': 'void run()', 'nota': 0},
        {'texto': 'void init()', 'nota': 0},
      ],
    },
    {
      'pergunta': 'No Dart, qual recurso/símbolo é utilizado junto ao tipo da variável para permitir que ela receba um valor nulo (Null Safety)?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'O ponto de exclamação (!)', 'nota': 0},
        {'texto': 'O underline (_)', 'nota': 0},
        {'texto': 'O ponto de interrogação (?)', 'nota': 1},
        {'texto': 'A palavra-chave void', 'nota': 0},
      ],
    },
    {
      'pergunta': 'Qual palavra-chave é utilizada para fazer com que uma classe herde os métodos e atributos de uma "classe pai" (superclasse)?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'implements', 'nota': 0},
        {'texto': 'extends', 'nota': 1},
        {'texto': 'with', 'nota': 0},
        {'texto': 'import', 'nota': 0},
      ],
    },
    {
      'pergunta': 'Como indicamos no Dart que uma variável ou função deve ser privada e visível apenas dentro do arquivo onde foi criada?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'Usando a palavra "private"', 'nota': 0},
        {'texto': 'Usando a anotação @private', 'nota': 0},
        {'texto': 'Declarando a variável como "final"', 'nota': 0},
        {'texto': 'Iniciando o nome com underline (_)', 'nota': 1}, 
      ],
    },
    {
      'pergunta': 'No Flutter, qual é o tipo de Widget utilizado quando a interface precisa se atualizar dinamicamente enquanto o usuário interage com o app?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'StatelessWidget', 'nota': 0},
        {'texto': 'StatefulWidget', 'nota': 1}, 
        {'texto': 'InheritedWidget', 'nota': 0},
        {'texto': 'MaterialWidget', 'nota': 0},
      ],
    },
    {
      'pergunta': 'Qual método é chamado dentro do código para avisar ao Flutter que uma variável mudou e que ele precisa redesenhar a tela com o novo valor?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'setState()', 'nota': 1}, 
        {'texto': 'updateScreen()', 'nota': 0},
        {'texto': 'build()', 'nota': 0},
        {'texto': 'refresh()', 'nota': 0},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _iniciarJogo() {
    setState(() {
      _jogoIniciado = true;
    });
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _tempoRestante = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_tempoRestante > 0) {
        setState(() {
          _tempoRestante--;
        });
      } else {
        _timer?.cancel();
        responder(0, null);
      }
    });
  }

  void responder(int nota, int? indiceClicado) async {
    if (_mostrandoGabarito) return;
    _timer?.cancel();
    setState(() {
      _mostrandoGabarito = true;
      _indiceEscolhido = indiceClicado;
    });
    await Future.delayed(Duration(milliseconds: 1500));
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        nota_total += nota;
        _mostrandoGabarito = false;
        _indiceEscolhido = null;
      });

      if (temPerguntaSelecionada) {
        _iniciarTimer();
      }
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      nota_total = 0;
      _jogoIniciado = false;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(120,0,0,255),
        ),

        body: !_jogoIniciado
          ? TelaInicial(_iniciarJogo) 
          : temPerguntaSelecionada
          ? Column(
            children: [
              LinearProgressIndicator(
                value: _tempoRestante / 30,
                minHeight: 12,
                backgroundColor: Colors.grey[300],
                color: _tempoRestante <= 10 ? Colors.red : Colors.green,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Tempo: $_tempoRestante s',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: _tempoRestante <= 10 ? Colors.red : Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Questionario(
                    perguntaSelecionada: perguntaSelecionada,
                    perguntas: perguntas,
                    responder: responder,
                    mostrandoGabarito: _mostrandoGabarito,
                    indiceEscolhido: _indiceEscolhido,
                  ),
                ),  
              ),
            ],
          )
        : Resultado(nota_total,reiniciarQuestionario),
      ),
    );
  }
}