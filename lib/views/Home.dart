import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agrotech/model/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCpf = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";
  bool _carregando = false;


  _validarCampos(){

    String cpf = _controllerCpf.text;
    String senha = _controllerSenha.text;
    String cpfF = CPF.format(cpf);

    if(cpf.isNotEmpty && cpf.length == 11){

      if(senha.isNotEmpty && senha.length > 6){

        Usuario usuario = Usuario();
        usuario.cpf = cpfF;
        usuario.senha = senha;

        _logarUsuario(usuario);

      }else{
        setState(() {
          _mensagemErro = "Preecha a senha! a senha deve conter no minimo 7 caracteres";
        });
      }
    }
  }

  _logarUsuario(Usuario usuario) async {

    setState(() {
      _carregando = true;
    });
    Firestore db = Firestore.instance;

    DocumentSnapshot snapshot = await db.collection("usuarios")
        .document()
        .get();

    Map<String, dynamic> dados = snapshot.data;
    String cpfF = dados["cpf"];
    String senha = dados["senha"];
    String tipoUsuario = dados["tipoUsuario"];

    if (cpfF == _controllerCpf && senha == _controllerSenha){
      //_redirecionaPainelPorTipoUsuario(Usuario);
      //Map<String, dynamic> dados = snapshot.data;


      switch(tipoUsuario){
        case "produtor":
          Navigator.pushReplacementNamed(context, "/painel-produtor");
          break;
        case "cliente":
          Navigator.pushReplacementNamed(context, "/painel-cliente");
          break;
      }
      _carregando = false;
    }else{
      _mensagemErro = "Erro ao autenticar usuário, verifique CPF e senha e tente novamente!";
      _carregando = false;
    }
  }

  /*_redirecionaPainelPorTipoUsuario(String idUsuario) async {

    Firestore db = Firestore.instance;

    DocumentSnapshot snapshot = await db.collection("usuarios")
        .document()
        .get();

    Map<String, dynamic> dados = snapshot.data;
    String tipoUsuario = dados["tipoUsuario"];

    setState(() {
      _carregando = false;
    });

    switch(tipoUsuario){
      case "produtor":
        Navigator.pushReplacementNamed(context, "/painel-produtor");
        break;
      case "cliente":
        Navigator.pushReplacementNamed(context, "/painel-cliente");
        break;
    }

  }*/

  /*_verificarUsuarioLogado() async {

    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser usuarioLogado = await auth.currentUser();
    if(usuarioLogado!=null){
      String idUsuario = usuarioLogado.uid;
      _redirecionaPainelPorTipoUsuario(idUsuario);
    }

  }*/

  @override
  void initState() {
    super.initState();

    //_verificarUsuarioLogado();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imagens/fundo.png"),
                fit: BoxFit.cover
            )
        ),*/
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "imagens/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                TextField(
                  controller: _controllerCpf,
                  autofocus: true,
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
                  padding: EdgeInsets.only(top: 16),
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
                          borderRadius: BorderRadius.circular(50)
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.deepOrange,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      onPressed: (){
                        _validarCampos();
                      }
                  )
                  ,
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? Cadastre-se!",
                      style: TextStyle(color: Colors.deepOrange),

                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "/cadastro");
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                _carregando ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),)
                    : Container(),
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
