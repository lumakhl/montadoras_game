import 'package:flutter/material.dart';

class RespostaItem extends StatelessWidget {
  
  final String texto;
  final Function quandoSelecionado;

  RespostaItem(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Theme.of(context).accentColor,
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
      margin: const EdgeInsets.all(4),
    );
  }
}