import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:montadoras_game/exceptions/http_exception.dart';
import 'package:montadoras_game/models/pergunta_model.dart';
import 'package:montadoras_game/utils/constants.dart';

class PerguntasService {

  Future<List<Pergunta>> getQuestoes() async {
    var ioc =  new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final client = new IOClient(ioc);
    Uri uri = new Uri.http(Constants.BASE_API_URL, Constants.BASE_PATH);

    final Response res = await client.get(uri);

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
