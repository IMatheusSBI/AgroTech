import 'package:flutter/material.dart';
import 'package:agrotech/model/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cpfcnpj/cpfcnpj.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  bool _tipoUsuario = false;
  String _mensagemErro = "";


  _validarCampos(){

    String nome = _controllerNome.text;
    String cpf = _controllerCpf.text;
    String senha = _controllerSenha.text;

    if(nome.isNotEmpty){
      String cpfF = CPF.format(cpf);
      if(cpfF.isNotEmpty && cpfF.length == 14 && CPF.isValid(cpfF)){
        if(senha.isNotEmpty && senha.length > 6){

          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.cpf = cpfF;
          usuario.senha = senha;
          usuario.tipoUsuario = usuario.verificaTipoUsuario(_tipoUsuario);

          _cadastrarUsuario( usuario );

        }else{
          setState(() {
            _mensagemErro = "Preecha a senha! a senha deve conter no minimo 7 caracteres";
          });
        }

      }else{
        setState(() {
          _mensagemErro = "CPF Invalido!";
        });
      }

    }else{
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }

  }

  _cadastrarUsuario(Usuario usuario){

    Firestore db = Firestore.instance;
    db.collection("usuarios")
        .document()
        .setData({
      "nome" : usuario.nome,
      "cpf" : usuario.cpf,
      "tipoUsuario" : usuario.tipoUsuario,
      "senha" : usuario.senha,

    });

    switch(usuario.tipoUsuario){
      case "produtor" :
        Navigator.pushNamedAndRemoveUntil(
            context,
            "/painel-produtor",
                (_) => false
        );
        break;
      case "cliente" :
        Navigator.pushNamedAndRemoveUntil(
            context,
            "/painel-cliente",
                (_) => false
        );
        break;
    }

    /*FirebaseAuth auth = FirebaseAuth.instance;
    Firestore db = Firestore.instance;


    auth.createUserWithEmailAndPassword(
        email: usuario.cpf,
        password: usuario.senha
    ).then((firebaseUser){

      db.collection("usuarios")
          .document()
          .setData(usuario.toMap());

      switch(usuario.tipoUsuario){
        case "produtor" :
          Navigator.pushNamedAndRemoveUntil(
              context,
              "/painel-produtor",
                  (_) => false
          );
          break;
        case "cliente" :
          Navigator.pushNamedAndRemoveUntil(
              context,
              "/painel-cliente",
                  (_) => false
          );
          break;
      }

    }).catchError((error){
      _mensagemErro = "Erro ao autenticar usuário, verifique e-mail e senha e tente novamente!";
    });*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _controllerNome,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 35, 16),
                      hintText: "Nome completo",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50 )
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextField(
                  controller: _controllerCpf,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 35, 16),
                      hintText: "CPF",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50 )
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 35, 16),
                      hintText: "senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50 )
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Text("Cliente"),
                      Switch(
                          value: _tipoUsuario,
                          onChanged: (bool valor){
                            setState(() {
                              _tipoUsuario = valor;
                            });
                          }),
                      Text("Produtor"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.deepOrange,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      onPressed: (){
                        _validarCampos();
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
