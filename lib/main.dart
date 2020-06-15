import 'package:flutter/material.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/providers/perguntas_service.dart';
import 'package:montadoras_game/views/questionario.dart';
import 'package:montadoras_game/views/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _totalAcertos = 0;

  PerguntasService service = PerguntasService();
  Future<List<Pergunta>> futurePerguntas;


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
            title: Text('Montadoras Quiz'),
          ),
          body: FutureBuilder(
            future: service.getQuestoes(),
            builder: (context, AsyncSnapshot<List<Pergunta>> snapshot) {
              if(snapshot.hasData) {
                return Questionario(perguntas: snapshot.data);
              } else {
                return Center(child: Text('Carregando...'));
              }
            }),
        ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
