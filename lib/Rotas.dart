import 'package:agrotech/views/PainelProdutorConfig.dart';
import 'package:flutter/material.dart';
import 'package:agrotech/views/Cadastro.dart';
import 'package:agrotech/views/Home.dart';
import 'package:agrotech/views/PainelProdutor.dart';
import 'package:agrotech/views/PainelCliente.dart';

class Rotas {

  static Route<dynamic> gerarRotas(RouteSettings settings){

    switch(settings.name){
      case "/":
        return MaterialPageRoute(
            builder: (_) => Home()
        );
      case "/cadastro":
        return MaterialPageRoute(
            builder: (_) => Cadastro()
        );
        case "/painel-produtor":
        return MaterialPageRoute(
            builder: (_) => PainelProdutor()
        );
        case "/painel-cliente":
        return MaterialPageRoute(
            builder: (_) => PainelCliente()
        );
        case "/painel-produtor-config":
          return MaterialPageRoute(
          builder: (_) => PainelProdutorConfig()
        );
      default:
        _erroRota();
    }

  }

  static Route<dynamic> _erroRota(){

    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(title: Text("Tela não encontrada"),),
            body: Center(
              child: Text("Tela não encontrada"),
            ),
          );
        }
    );

  }

}