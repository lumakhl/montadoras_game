import 'package:flutter/cupertino.dart';

class Resposta {
  final int id;
  final String descricao;
  final bool ehCerta;

  Resposta({
    @required this.id,
    @required this.descricao,
    @required this.ehCerta,
  });

  factory Resposta.fromJson(Map<String, dynamic> json) {
    return Resposta(
      id: json['id'] as int,
      descricao: json['descricao'] as String,
      ehCerta: json['ehCerta'] as bool,
    );
  }
}
