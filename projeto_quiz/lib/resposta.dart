import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() quandoRespondido;
  final Color corFundo;

  Resposta(this.texto, this.quandoRespondido, this.corFundo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: quandoRespondido,
        child: Text(texto),
        style: ElevatedButton.styleFrom(
        backgroundColor: corFundo,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))
      )
      )
    );
  }
}