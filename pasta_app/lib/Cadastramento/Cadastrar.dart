import 'package:flutter/material.dart';
import 'package:pasta_app/Gerenciamento_de_Estado/GerenciamentodeDados.dart';
import 'package:provider/provider.dart';

class Cadastrar extends StatelessWidget {
  TextEditingController nomec = TextEditingController();
  TextEditingController inicioc = TextEditingController();
  TextEditingController fimc = TextEditingController();
  Cadastrar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar', style: TextStyle(color: Colors.white,),),backgroundColor:  Colors.teal,),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('icones/lista-de-tarefas2.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: nomec,decoration: InputDecoration(label: Row(
              children: [
                Image.asset('icones/lista-de-tarefas.png'),
                Text(' Nome da tarefa...'),
              ],
            ), border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black))),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: inicioc,decoration: InputDecoration(label: Row(
              children: [
                Image.asset('icones/calendario.png'),
                Text(' Data de início...'),
              ],
            ), border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black))),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: fimc,decoration: InputDecoration(label: Row(
              children: [
                Image.asset('icones/calendario.png'),
                Text(' Data de termino...'),
              ],
            ), border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black))),),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: GestureDetector(onTap: (){context.read<GerenciamentoDB>().inserir(nomec.text, inicioc.text, fimc.text);Navigator.pop(context);},child: Container(width: 200,height: 100,decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black,width: 2),),child: Center(child: Text('Cadastrar',style: TextStyle(fontSize: 25, color: Colors.white,decoration: TextDecoration.none),),),),),
        )
        ],),
      ),
    );
  }
}
