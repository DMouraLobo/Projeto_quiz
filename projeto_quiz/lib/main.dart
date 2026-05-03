import 'package:flutter/material.dart';
import 'package:projeto_quiz/questao.dart';

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
    print("Valor da variável: $perguntaSelecionada");
  }

  @override
  Widget build(BuildContext context){
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(120,0,0,255),
        ),
        body: Column(
          children: [
            Questao(perguntas[perguntaSelecionada]),
            ElevatedButton(onPressed: responder, child: Text ('Resposta 1')),
            ElevatedButton(onPressed: responder, child: Text ('Resposta 2')),
            ElevatedButton(onPressed: responder, child: Text ('Resposta 3'))
          ],
        ),
      ),
    );
  }
}