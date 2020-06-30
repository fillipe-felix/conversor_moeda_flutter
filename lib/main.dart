import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const request = "https://api.hgbrasil.com/finance?format=json&key=e4ed03e3";

void main() async {
  //print(await getData());
  //print(json.decode(response.body)["results"]["currencies"]["USD"]);

  runApp(MaterialApp(
    home: Home(),
  ));
}

//Função para acessar a Requisição e converter para JSON
Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor de Moeda \$"),
        centerTitle: true,
        backgroundColor: Colors.amber[600],
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        //Context é o contexto e o snapshot é uma copia momentania dos dados da requisição
        builder: (context, snapshot) {
          //Verifica o estado da conexão
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              //Center centraliza outro Widget
              return Center(
                child: Text(
                  "Carregando dados...",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
              //Caso ele obter alguma coisa ele retorna o default
            default:
              if(snapshot.hasError){
                return Center(
                  child: Text(
                    "Error ao carregar dados :( ",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }else{
                return Container(
                  color: Colors.green,
                );
              }
          }
        },
      ),
    );
  }
}
