import 'package:flutter/material.dart';
import 'package:projeto_quiz/questao.dart';
import 'package:projeto_quiz/resposta.dart';

class Questionario extends StatelessWidget{

  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int, int?) responder;
  final bool mostrandoGabarito;
  final int? indiceEscolhido;

  Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
    required this.mostrandoGabarito,
    required this.indiceEscolhido,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,Object>> respostas = temPerguntaSelecionada
    ? perguntas[perguntaSelecionada].cast()['respostas']
    :[];
    
    return Column(
          children: [
            Questao(perguntas[perguntaSelecionada]['pergunta'].toString(),
            perguntas[perguntaSelecionada]['imagem'].toString()),
            ...respostas.asMap().entries.map((entrada) {
              int indice = entrada.key;
              Map<String, Object> resp = entrada.value;
              int notaResp = int.parse(resp['nota'].toString());

              Color corBotao = Colors.blue;

              if (mostrandoGabarito) {
                if (notaResp == 1) {
                  corBotao = Colors.green;
                } else if (indice == indiceEscolhido) {
                  corBotao = Colors.red;
                } else {
                  corBotao = Colors.grey;
                }
              }

              return Resposta(
                resp['texto'] as String,          
                () {
                  if (!mostrandoGabarito) {
                    responder(notaResp, indice);
                  }
                },
                corBotao,
                );
            }).toList(),
          ],
    );
  }
}
