import 'package:flutter/material.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/providers/perguntas.dart';
import 'package:montadoras_game/views/questionario.dart';
import 'package:montadoras_game/views/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _totalAcertos = 0;

  Future<List<Pergunta>> futurePerguntas;

  @override
  void initState() {
    super.initState();

    futurePerguntas = PerguntasService().getQuestoes();
  }

  void _responder(int acerto) {
    setState(() {
      _perguntaSelecionada++;
      _totalAcertos += acerto;
    });
  }
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'ehCerto': false},
        {'texto': 'Branco', 'ehCerto': false},
        {'texto': 'Cinza', 'ehCerto': true},
        {'texto': 'Azul', 'ehCerto': false}
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Preto', 'ehCerto': false},
        {'texto': 'Jiboia', 'ehCerto': false},
        {'texto': 'Macaco', 'ehCerto': true},
        {'texto': 'Azul', 'ehCerto': false}
      ]
    },
    {
      'texto': 'Qual o seu melhor amigo?',
      'respostas': [
        {'texto': 't', 'ehCerto': false},
        {'texto': 'a', 'ehCerto': false},
        {'texto': 'Cinza', 'ehCerto': true},
        {'texto': 'Azul', 'ehCerto': false}
      ]
    }
  ];

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _totalAcertos = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  String get _porcentagemAcerto {
    double porcentagem = (_totalAcertos / _perguntas.length) * 100;
    return porcentagem.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blueAccent,
          fontFamily: 'Lato',
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(_),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(_porcentagemAcerto, _reiniciarQuestionario),
        ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
