import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Tarefas", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.dark,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
              decoration: InputDecoration(
              labelText: "Nova Tarefa",
              labelStyle: TextStyle(color: Colors.black26),
              ),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.black54,
                child: Text("Add"),
                textColor: Colors.white,
                  onPressed: () {  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async{
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async{
    try{

      final file = await _getFile();
      return file.readAsString();

    }catch (e){

      return null;

    }
  }

}
