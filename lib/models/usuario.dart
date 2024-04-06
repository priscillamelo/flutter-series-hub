class Usuario {
  const Usuario({
    required String nome,
    required String sobrenome,
    required String nomeUsuario,
    required String email,
    required String senha,
    required String? imgPerfil,
  });
  /* late String nome;
  late String sobrenome;
  late String nomeUsuario;
  late String email;
  late String senha; */

  Usuario criarConta(
    String nome,
    String sobrenome,
    String nomeUsuario,
    String email,
    String senha,
    String? imgPerfil,
  ) {
    return Usuario(
        nome: nome,
        sobrenome: sobrenome,
        nomeUsuario: nomeUsuario,
        email: email,
        senha: senha,
        imgPerfil: imgPerfil);
  }

  void logar(String nomeUsuario, String senha) {}
}
