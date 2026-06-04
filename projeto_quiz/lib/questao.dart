import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

  final String texto;
  final String imagem;
  Questao(this.texto, this.imagem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Image.asset(imagem, width: 300,),
          SizedBox(height: 40),
          Text(
            texto,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}