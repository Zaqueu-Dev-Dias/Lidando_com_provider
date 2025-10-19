import 'package:flutter/material.dart';
import 'package:pasta_app/tela_inicial/tela_principal.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'Cadastramento/Cadastrar.dart';
import 'Gerenciamento_de_Estado/GerenciamentodeDados.dart';
import 'Pasta_carregamento/Carregamento_inicial.dart';
import 'Pasta_carregamento/Erro_carregamento.dart';
import 'Pasta_carregamento/animacao_carregar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<GerenciamentoDB>(create: (_) => GerenciamentoDB(), builder: (context, child){return MaterialApp(
      home: FutureBuilder(future: context.watch<GerenciamentoDB>().inicializardb(), builder: (context, situacao){
        if(situacao.hasData){
          return TelaPrincipal();
        }else if(situacao.hasError){
          print('xxxxxx${situacao.data}xxxxxxx');
          return ErroCarregamento();
        }else{
          return AnimacaoCarregar();
        }
      }),
    );},)],
  ) );
}
