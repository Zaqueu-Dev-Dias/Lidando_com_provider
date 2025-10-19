import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuscandoDados extends StatelessWidget {
  const BuscandoDados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      Lottie.asset('animacoes/Loading_Files.json'),
      Text('Buscando dados...',style: TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.black),)],),);;
  }
}
