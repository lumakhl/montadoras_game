import 'package:flutter/cupertino.dart';
import 'package:montadoras_game/models/resposta_model.dart';

class Pergunta {
  final int id;
  final String descricao;
  final List<Resposta> respostas;

  Pergunta({
    @required this.id,
    @required this.descricao,
    @required this.respostas,
  });

  factory Pergunta.fromJson(Map<String, dynamic> json) {
    List<Resposta> respostas = json['respostas'].map<Resposta>(
      (resposta) => Resposta.fromJson(resposta),
    ).toList();
    return Pergunta(
      id: json['id'] as int,
      descricao: json['descricao'] as String,
      respostas: respostas);
  }
}
