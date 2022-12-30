import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String _currentPergunta;

  const Questao(this._currentPergunta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      child: Text(
        _currentPergunta,
        style: const TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
