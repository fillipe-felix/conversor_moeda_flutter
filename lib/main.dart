
import 'dart:convert';

import 'package:flutter/material.dart';
//import do pacote http para fazer as requisições
import 'package:http/http.dart' as http;
//impor do pacote async para poder trabalhar com requisições asincronas
import 'dart:async';
//import para converter os dados para json
import 'dart:convert';

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

      body: ,
    );
  }
}


