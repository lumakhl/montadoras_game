import 'package:flutter/material.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/providers/perguntas_service.dart';
import 'package:montadoras_game/views/questionario.dart';
import 'package:montadoras_game/views/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  PerguntasService service = PerguntasService();
  Future<List<Pergunta>> futurePerguntas;

  @override
  void initState() {
    super.initState();
    futurePerguntas = service.getQuestoes();
  }

  void _reiniciarQuestionario() {
    setState(() {
      futurePerguntas = service.getQuestoes();
    });
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
              future: futurePerguntas,
              builder: (context, AsyncSnapshot<List<Pergunta>> snapshot) {
                if (snapshot.hasData && snapshot.data.length > 0) {
                  return Questionario(
                    perguntas: snapshot.data,
                    reiniciarQuestionario: _reiniciarQuestionario,
                  );
                } else {
                  return Center(child: Text('Carregando... Caso demore tente reiniciar o app!'));
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
