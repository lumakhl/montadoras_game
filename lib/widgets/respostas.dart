import 'package:flutter/cupertino.dart';
import 'package:montadoras_game/models/resposta_model.dart';
import 'package:montadoras_game/widgets/resposta_item.dart';

class Respostas extends StatelessWidget {
  final List<Resposta> respostas;
  final void Function(int) responder;

  Respostas(this.respostas, this.responder);
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
          crossAxisCount: 2,
          children: List.generate(respostas.length, (index) {
            return RespostaItem(respostas[index].descricao, () => responder(respostas[index].ehCerta ? 1 : 0));
          })
          );
  }
}
