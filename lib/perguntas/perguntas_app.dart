import 'package:basic_flutter/perguntas/components/questionario/questionario.dart';
import 'package:basic_flutter/perguntas/components/resultado/resultado.dart';
import 'package:flutter/material.dart';

class PerguntasApp extends StatefulWidget {
  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  int _nextQuestion = 0;
  int _pontuacaoTotal = 0;

  void responder(String reposta) {
    print(reposta);
    setState(() {
      var listRespostas =
          _perguntas[_nextQuestion]['respostas'] as List<Map<String, Object>>;
      _pontuacaoTotal += listRespostas
          .firstWhere((e) => e['texto'] == reposta)['score'] as int;
      if (existNextQuestion) {
        _nextQuestion++;
      }
    });
  }

  void reiniciarQuestionario() {
    setState(() {
      _nextQuestion = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get existNextQuestion {
    return _nextQuestion < _perguntas.length;
  }

  int get pontuacaoTotal {
    return _pontuacaoTotal;
  }

  static const List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'score': 10},
        {'texto': 'Vermelho', 'score': 5},
        {'texto': 'Verde', 'score': 3},
        {'texto': 'Branco', 'score': 1}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'score': 10},
        {'texto': 'Cobra', 'score': 5},
        {'texto': 'Elefante', 'score': 3},
        {'texto': 'Leão', 'score': 1}
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'score': 10},
        {'texto': 'João', 'score': 5},
        {'texto': 'Leo', 'score': 3},
        {'texto': 'Pedro', 'score': 1}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return existNextQuestion
        ? Questionario(
            perguntas: _perguntas,
            responder: responder,
            nextQuestion: _nextQuestion,
          )
        : Resultado(_pontuacaoTotal, reiniciarQuestionario);
  }
}
