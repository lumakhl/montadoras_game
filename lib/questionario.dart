import 'package:flutter/material.dart';
import 'package:montadoras_game/questao.dart';
import 'package:montadoras_game/resposta.dart';
import 'package:montadoras_game/respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Container(
      margin: const EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Questao(perguntas[perguntaSelecionada]['texto']),
          Expanded(
              child: SizedBox(
            child: Respostas(respostas, responder),
          )),
          Text(
            '${perguntaSelecionada + 1}/${perguntas.length}',
            style: TextStyle(fontSize: 20)
          )
        ],
      ),
    );
  }
}
