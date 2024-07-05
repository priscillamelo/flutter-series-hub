import 'package:flutter/material.dart';
// SERVICE
import '../../services/auth/auth_sevice.dart';
// WIDGET
import '../widgets/customs/snackbar_widget.dart';
import '../widgets/customs/text_form_login_widgets.dart';

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({super.key});

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthenticationService _authenticationService = AuthenticationService();

  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final nomeUsuarioController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo_app.png'),
        centerTitle: true,
        forceMaterialTransparency: true,
        toolbarHeight: 150,
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Criar Conta',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        LoginFormFieldWidget(
                          label: 'Nome',
                          controller: nomeController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LoginFormFieldWidget(
                          label: 'Sobrenome',
                          controller: sobrenomeController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LoginFormFieldWidget(
                          label: 'Nome de usuário',
                          controller: nomeUsuarioController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LoginFormFieldWidget(
                          label: 'E-mail',
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LoginFormFieldWidget(
                          label: 'Senha',
                          controller: senhaController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LoginFormFieldWidget(
                          label: 'Confirmar senha',
                          controller: confirmarSenhaController,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authenticationService
                          .cadastrarUsuario(
                              nome: nomeController.text,
                              sobrenome: sobrenomeController.text,
                              nomeUsuario: nomeUsuarioController.text,
                              email: emailController.text,
                              senha: senhaController.text)
                          .then((String? erro) {
                        if (erro != null) {
                          showSnackBar(context: context, text: erro);
                        } else {
                          showSnackBar(
                              context: context,
                              text: "Cadastro efetuado com sucesso!",
                              isError: false);
                          //Navigator.popAndPushNamed(context, '/home');
                        }
                      });
                    }
                  },
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.only(
                        top: 16,
                        right: 52,
                        bottom: 16,
                        left: 52,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/login");
                  },
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.all(
                      const TextStyle(
                        decoration: TextDecoration.underline,
                        letterSpacing: 2,
                        wordSpacing: 3,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Já tem uma conta? Clique aqui",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
