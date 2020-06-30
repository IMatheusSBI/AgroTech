import 'package:flutter/material.dart';
import 'package:agrotech/views/Home.dart';
import 'Rotas.dart';

void main() {
  runApp(MaterialApp(
    title: "AgroTech",
    theme: ThemeData(
        primarySwatch: Colors.deepOrange
    ),
    home: Home(),
    initialRoute: "/",
    onGenerateRoute: Rotas.gerarRotas,
    debugShowCheckedModeBanner: false,
  ));
}


