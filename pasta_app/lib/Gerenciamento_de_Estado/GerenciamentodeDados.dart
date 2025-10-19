

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
class GerenciamentoDB with ChangeNotifier{

  GerenciamentoDB._();

  String nomecl = '';
  String iniciocl = '';
  String fimcl = '';

  GerenciamentoDB();

   Database? _database;

   Future<Database> inicializardb()async{
     print('entrou');
    if(_database != null){
      return _database!;
    }else{
      print('888888888888888888888888888');
      return  _database = await openDatabase(
        join(
            await getDatabasesPath(),'dbarquivo.db'),
            version: 1,
            onCreate: (db, versao)async{
                        print('XXXXXXXXXXXX');
                        await db.execute('CREATE TABLE gerencitable(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, inicio TEXT, fim TEXT, cor TEXT)');
                        await db.execute('CREATE TABLE lightordark(id INTEGER PRIMARY KEY AUTOINCREMENT, modo TEXT)');}
      );
    }
  }
   void inserir(String nome, String inicio, String fim)async{
    if(_database != null){
      await _database!.insert('gerencitable', {'nome': nome, 'inicio':inicio, 'fim':fim});
      notifyListeners();
    }else{
     await inicializardb();
     await _database!.insert('gerencitable', {'nome': nome, 'inicio':inicio, 'fim':fim});
     notifyListeners();
    }
  }

   Future<List<Map<String, Object?>>>? trazerdados()async{
     await Future.delayed(Duration(seconds: 2));
    if(_database != null){
      return await _database!.query('gerencitable');
    }else{
      await inicializardb();
      return await _database!.query('gerencitable');
    }
  }

  void apagar(var id)async{
     if(_database != null){
       await _database!.delete('gerencitable',where: 'id = ?', whereArgs: [id]);
       notifyListeners();
     }else{
       await inicializardb();
       await _database!.delete('gerencitable',where: 'id = ?', whereArgs: [id]);
       notifyListeners();
     }
  }
}