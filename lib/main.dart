
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

  http.Response response = await http.get(request);
  print(json.decode(response.body)["results"]["currencies"]["USD"]);

  runApp(MaterialApp(
    home: Container(),
  ));
}


