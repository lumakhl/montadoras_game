import 'package:flutter/material.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/models/resposta_model.dart';
import 'package:montadoras_game/views/resultado.dart';
import 'package:montadoras_game/widgets/questao.dart';
import 'package:montadoras_game/widgets/respostas.dart';

class Questionario extends StatefulWidget {
  final List<Pergunta> perguntas;

  Questionario({
    @required this.perguntas,
  });

  @override
  _QuestionarioState createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  var _perguntaSelecionada = 0;
  var _totalAcertos = 0;

  void _responder(int acerto) {
    setState(() {
      _perguntaSelecionada++;
      _totalAcertos += acerto;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _totalAcertos = 0;
    });
  }

  String get _porcentagemAcerto {
    double porcentagem = (_totalAcertos / widget.perguntas.length) * 100;
    return porcentagem.toStringAsFixed(2);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < widget.perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Resposta> respostas = temPerguntaSelecionada
        ? widget.perguntas[_perguntaSelecionada].respostas
        : null;

    return Container(
        margin: const EdgeInsets.all(4),
        child: Column(
          children: temPerguntaSelecionada
              ? <Widget>[
                  Questao(widget.perguntas[_perguntaSelecionada].descricao),
                  Expanded(
                      child: SizedBox(
                    child: Respostas(respostas, _responder),
                  )),
                  Text('${_perguntaSelecionada + 1}/${widget.perguntas.length}',
                      style: TextStyle(fontSize: 20))
                ]
              : <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 250),
                    child: Center(
                        child: Resultado(
                            _porcentagemAcerto, _reiniciarQuestionario)),
                  ),
                ],
        ));
  }
}
