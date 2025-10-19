import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pasta_app/Gerenciamento_de_Estado/GerenciamentodeDados.dart';
import 'package:pasta_app/tela_inicial/Buscando_dados.dart';
import 'package:pasta_app/tela_inicial/tarefas.dart';
import 'package:provider/provider.dart';

import '../Cadastramento/Cadastrar.dart';
import 'Erro_tela_inicial.dart';
import 'nada_encontrado.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,),
      floatingActionButton: GestureDetector(onTap: (){Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => Cadastrar(),
        ),
      );},child: Container(width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2)),
        child: Icon(Icons.add, color: Colors.white,),),),
      body:FutureBuilder(future: context.watch<GerenciamentoDB>().trazerdados(), builder: (contexto, resultado){
        if(resultado.hasData){
          if(listEquals(resultado.data, [])){
            return NadaEncontrado();
          }else{
            return ListView.builder(itemCount: resultado.data!.length,itemBuilder: (context, numeros){
              return Tarefas(dados: resultado.data![numeros]);
            });
          }
        }else if(resultado.hasError){
          return ErroTelaInicial();
        }else{
          return BuscandoDados();
        }
      }),
    );
  }
}


