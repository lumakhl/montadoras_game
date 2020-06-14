import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:montadoras_game/exceptions/http_exception.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/utils/constants.dart';

class PerguntasService {

  Future<List<Pergunta>> getQuestoes() async {
    var client =  http.Client();

    Response res = await client.get(new Uri.http(Constants.BASE_API_URL, Constants.BASE_PATH));

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
