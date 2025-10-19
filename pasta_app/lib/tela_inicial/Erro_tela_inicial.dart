import 'package:flutter/material.dart';


class ErroTelaInicial extends StatelessWidget {
  const ErroTelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child:
    Center(child:
    Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      Image.asset('icones/aviso.png'),
      Container(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Não foi possivel ter acesso ao banco de dados!', style: TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),
      ))]),),);
  }
}
