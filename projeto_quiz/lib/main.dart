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

  final perguntas = const[
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'Preto', 'nota': 0},
        {'texto': 'Vermelho', 'nota': 0},
        {'texto': 'Verde', 'nota': 0},
        {'texto': 'Branco', 'nota': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'Coelho', 'nota': 0},
        {'texto': 'Tartaruga', 'nota': 0},
        {'texto': 'Elefante', 'nota': 0},
        {'texto': 'Leão', 'nota': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu alimento favorito?',
      'imagem': 'assets/images/logo.png',
      'respostas': [
        {'texto': 'Massas', 'nota': 0},
        {'texto': 'Carnes', 'nota': 0},
        {'texto': 'Grãos', 'nota': 0},
        {'texto': 'Vegetais', 'nota': 1},
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
        responder(0);
      }
    });
  }

  void responder(int nota){
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        nota_total += nota;
      });

      _timer?.cancel();

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
                    responder: responder
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