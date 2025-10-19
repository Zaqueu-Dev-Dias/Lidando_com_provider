import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Gerenciamento_de_Estado/GerenciamentodeDados.dart';
import '../tela_inicial/tela_principal.dart';
import 'Erro_carregamento.dart';
import 'animacao_carregar.dart';

class CarregamentoInicial extends StatelessWidget {
  const CarregamentoInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider<GerenciamentoDB>(create: (context) => GerenciamentoDB(), builder: (context, child){return FutureBuilder(future: context.watch<GerenciamentoDB>().inicializardb(), builder: (context, situacao){
      if(situacao.hasData){
        return TelaPrincipal();
      }else if(situacao.hasError){
        print('xxxxxx${situacao.data}xxxxxxx');
        return ErroCarregamento();
      }else{
        return AnimacaoCarregar();
      }
    });},)],
                          ) ;
  }
}
