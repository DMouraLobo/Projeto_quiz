import 'package:flutter/material.dart';
import 'package:projeto_quiz/questionario.dart';
import 'package:projeto_quiz/resultado.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {


  PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
    final perguntas = [
      {
        'pergunta': 'Qual é a sua cor favorita?',
        'respostas': ['Preto','Vermelho','Verde','Branco']
      },
      {
        'pergunta': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho','Tartaruga','Elefante','Leão']
      },
      {
        'pergunta': 'Qual é o seu alimento favorito?',
        'respostas': ['Massas','Carnes','Grãos','Vegetais']
      },
    ];

  void responder(){
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(120,0,0,255),
        ),
        body: temPerguntaSelecionada 
        ? Questionario(perguntaSelecionada: perguntaSelecionada,
        perguntas: perguntas,
        responder: responder)
        : Resultado(),
      ),
    );
  }
}