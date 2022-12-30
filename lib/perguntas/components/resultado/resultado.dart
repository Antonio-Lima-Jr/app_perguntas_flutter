import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final Function() reiniciarQuestionario;

  const Resultado(
    this.pontuacaoTotal,
    this.reiniciarQuestionario, {
    Key? key,
  }) : super(key: key);

  String get fraseResultado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns!';
    } else if (pontuacaoTotal < 12) {
      return 'Você é bom!';
    } else if (pontuacaoTotal < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$fraseResultado \n Score: $pontuacaoTotal',
            style: TextStyle(fontSize: 28),
          ),
          TextButton(
            onPressed: reiniciarQuestionario,
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            child: const Text('Reiniciar?', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
