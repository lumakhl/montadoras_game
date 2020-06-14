import 'dart:convert';

import 'package:http/http.dart';
import 'package:montadoras_game/exceptions/http_exception.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/utils/constants.dart';

class PerguntasService {
  Future<List<Pergunta>> getQuestoes() async {
    Response res = await get('${Constants.BASE_API_URL}');

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Pergunta> perguntas = body
          .map(
            (dynamic item) => Pergunta.fromJson(item),
          )
          .toList();
          return perguntas;
    } else {
      throw HttpException("Não foi possível recuperar os dados, tente novamente");
    }
  }
}
