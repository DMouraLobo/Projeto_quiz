import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  Resultado(this.nota);

  String get fraseResultado{
    if(nota < 8){
      return 'Pode melhorar!';
    } else if(nota < 12){
      return 'Bom!';
    } else if(nota < 16){
      return 'Ótimo!';
    } else {
      return 'Excelente!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(fraseResultado,
        style: TextStyle(
          fontSize: 25,
          color: Colors.blue
        ),
      ),
    );
  }
}