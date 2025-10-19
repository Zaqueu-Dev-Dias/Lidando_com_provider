import 'package:flutter/material.dart';

class NadaEncontrado extends StatelessWidget {
  const NadaEncontrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('icones/vazio.png'),
        Text('Não há tarefa cadastrada!',style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),)],),
    );
  }
}
