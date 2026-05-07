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

    List<String> respostas = temPerguntaSelecionada
    ? perguntas[perguntaSelecionada].cast()['respostas']
    :[];
    List<Widget> widgets = respostas.map((t)=>Resposta(t, responder)).toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(120,0,0,255),
        ),
        body: temPerguntaSelecionada ? Column(
          children: [
            Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
            ...widgets,
          ],
        ) : Center(
          child: Text('Parabéns!' ,
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue
          ),
          ),
          ),
      ),
    );
  }
}