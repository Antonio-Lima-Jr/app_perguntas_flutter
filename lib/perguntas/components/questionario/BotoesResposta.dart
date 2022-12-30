import 'package:flutter/material.dart';

class BotoesResposta {
  late final Function(String response) onPressed;
  late final List<String> respostas;

  BotoesResposta(
      {required this.onPressed, this.respostas = const <String>[]});

  List<Widget> butons() {
    return respostas
        .map((resposta) => MaterialButton(
              onPressed: () => onPressed(resposta),
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(resposta),
            ))
        .toList();
  }
}
