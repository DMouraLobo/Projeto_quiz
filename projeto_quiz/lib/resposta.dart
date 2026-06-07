import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() quandoRespondido;
  Resposta(this.texto, this.quandoRespondido);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: quandoRespondido,
        child: Text(texto),
        style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 123, 129, 214),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))
      )
      )
    );
  }
}