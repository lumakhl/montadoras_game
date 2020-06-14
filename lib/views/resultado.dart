import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String resultado;
  final void Function() reiniciarQuestionario;

  Resultado(this.resultado, this.reiniciarQuestionario);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(resultado, style: TextStyle(fontSize: 28)),
        ),
        FlatButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
