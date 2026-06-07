import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function () quandoReiniciar;

  Resultado(this.nota, this.quandoReiniciar);

  String get fraseResultado{
    if(nota < 2){
      return 'Pode melhorar!';
    } else if(nota < 4){
      return 'Bom!';
    } else if(nota < 6){
      return 'Ótimo!';
    } else {
      return 'Excelente!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset('assets/images/logo.png', width: 300,),
            SizedBox(height: 40),
            Center(
              child: Text(fraseResultado,
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
            ),
            Text(
              'Você acertou $nota de 6',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        TextButton(
          onPressed: quandoReiniciar,
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
        ),
      ],
    );
  }
}