import 'package:basic_flutter/perguntas/components/questionario/BotoesResposta.dart';
import 'package:basic_flutter/perguntas/components/questionario/questao.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final Function(String response) responder;
  final int nextQuestion;

  const Questionario({
    Key? key,
    required this.perguntas,
    required this.responder,
    required this.nextQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listRespostas = perguntas[nextQuestion]['respostas'] as List<Map<String, Object>>;
    return Column(
      children: [
        Questao(perguntas[nextQuestion]['texto'] as String),
        ...BotoesResposta(
          onPressed: (e) => responder(e),
          respostas: listRespostas.map((e) => e['texto'] as String).toList(),
        ).butons(),
      ],
    );
  }
}
