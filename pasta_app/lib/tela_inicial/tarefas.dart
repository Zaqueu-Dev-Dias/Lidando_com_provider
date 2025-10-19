import 'package:flutter/material.dart';
import 'package:pasta_app/Gerenciamento_de_Estado/GerenciamentodeDados.dart';
import 'package:provider/provider.dart';

class Tarefas extends StatelessWidget {
  Map<String, Object?> dados;
  Tarefas({super.key, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(child: Container(width: 350, height: 200,decoration:
        BoxDecoration(color: Colors.teal[200],borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black)),child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('${dados['nome']}',style: TextStyle(fontSize: 30, color: Colors.white, decoration: TextDecoration.none),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Inicio: ${dados['inicio']}', style: TextStyle(fontSize: 25, color: Colors.white, decoration: TextDecoration.none),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Fim: ${dados['fim']}',style: TextStyle(fontSize: 25, color: Colors.white, decoration: TextDecoration.none),),
              )],),
            GestureDetector(onTap: (){context.read<GerenciamentoDB>().apagar(dados['id']);},child: Image.asset('icones/lata-de-lixo.png'),)
          ],
        ),)),
    );
  }
}
