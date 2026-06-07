import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  final void Function() iniciarJogo;

  TelaInicial(this.iniciarJogo);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', width: 300,),
          SizedBox(height: 40),
          Text(
            'Bem-vindo ao Dart Quiz!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 123, 129, 214),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Você tem 30 segundos para cada pergunta.\nPrepare-se!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: iniciarJogo,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'INICIAR JOGO',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}