import 'package:flutter/material.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/models/resposta_model.dart';
import 'package:montadoras_game/widgets/questao.dart';
import 'package:montadoras_game/widgets/respostas.dart';

class Questionario extends StatelessWidget {
  final List<Pergunta> perguntas;
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
    List<Resposta> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].respostas
        : null;

    return Container(
      margin: const EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Questao(perguntas[perguntaSelecionada].descricao),
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
