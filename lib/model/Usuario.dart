
class Usuario {

  String _idUsuario;
  String _nome;
  String _cpf;
  String _senha;
  String _tipoUsuario;

  Usuario();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "nome" : this.nome,
      "CPF" : this._cpf,
      "tipoUsuario" : this.tipoUsuario,
    };

    return map;

  }

  String verificaTipoUsuario(bool tipoUsuario){
    return tipoUsuario ? "produtor" : "cliente";
  }


  String get tipoUsuario => _tipoUsuario;

  set tipoUsuario(String value) {
    _tipoUsuario = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }


}