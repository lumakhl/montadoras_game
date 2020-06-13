import 'package:flutter/cupertino.dart';
import 'package:montadoras_game/widgets/resposta.dart';

class Respostas extends StatelessWidget {
  final List<Map<String, Object>> respostas;
  final void Function(int) responder;

  Respostas(this.respostas, this.responder);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
          crossAxisCount: 2,
          children: List.generate(respostas.length, (index) {
            return Resposta(respostas[index]['texto'], () => responder(respostas[index]['ehCerto'] ? 1 : 0));
          })
          );
  }
}
