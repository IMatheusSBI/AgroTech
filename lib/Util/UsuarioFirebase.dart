import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agrotech/model/Usuario.dart';

class UsuarioFirebase {

  static Future<FirebaseUser> getUsuarioAtual() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    return await auth.currentUser();

  }

  static Future<Usuario> getDadosUsuarioLogado() async {

    FirebaseUser firebaseUser = await getUsuarioAtual();


    Firestore db = Firestore.instance;

    DocumentSnapshot snapshot = await db.collection("usuario")
        .document()
        .get();

    Map<String, dynamic> dados = snapshot.data;
    String tipoUsuario = dados ["tipoUsuario"];
    String cpf = dados ["CPF"];
    String nome = dados ["nome"];
    String senha = dados ["senha"];

    Usuario usuario = Usuario();
    //usuario.idUsuario = idUsuario;
    usuario.tipoUsuario = tipoUsuario;
    usuario.cpf = cpf;
    usuario.nome = nome;
    usuario.senha = senha;


    return usuario;

  }

}