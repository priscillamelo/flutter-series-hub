import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/services/auth/auth_sevice.dart';
import 'package:flutter_journal_moviesandseries/widgets/customs/snackbar_widget.dart';
import 'package:flutter_journal_moviesandseries/widgets/customs/text_form_login_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthenticationService _authenticationService = AuthenticationService();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
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
                  'Login',
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
                          label: 'E-mail',
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        LoginFormFieldWidget(
                          label: 'Senha',
                          controller: _senhaController,
                        ),
                        Container(
                          alignment: AlignmentDirectional.topEnd,
                          child: TextButton(
                            onPressed: () {
                              //Navigator.popAndPushNamed(context, '/criarConta');
                            },
                            style: ButtonStyle(
                              alignment: AlignmentDirectional.topEnd,
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 2,
                                  wordSpacing: 3,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Xiiii! Esqueceu a senha?",
                              textAlign: TextAlign.end,
                            ),
                          ),
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
                          .logarUsuario(
                              email: _emailController.text,
                              senha: _senhaController.text)
                          .then((String? erro) {
                        if (erro != null) {
                          showSnackBar(context: context, text: erro);
                        } else {
                          Navigator.popAndPushNamed(context, '/home');
                        }
                      });
                    }
                  },
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.only(
                        top: 16,
                        right: 52,
                        bottom: 16,
                        left: 52,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Entrar",
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
                    Navigator.popAndPushNamed(context, '/criarConta');
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        decoration: TextDecoration.underline,
                        letterSpacing: 2,
                        wordSpacing: 3,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Não tem uma conta? Crie aqui!",
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
