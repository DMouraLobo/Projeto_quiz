import 'package:flutter/material.dart';
import 'package:projeto_quiz/questao.dart';
import 'package:projeto_quiz/resposta.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {


  PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder(){
    setState(() {
      perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context){
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

    List<String> respostas = perguntas[perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets = respostas.map((t)=>Resposta(t, responder)).toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(120,0,0,255),
        ),
        body: Column(
          children: [
            Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
            ...widgets,
          ],
        ),
      ),
    );
  }
}