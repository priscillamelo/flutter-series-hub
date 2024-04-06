import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_journal_moviesandseries/widgets/text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
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
                  'Realizar login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Form(
                    child: Column(
                      children: [
                        FormFieldWidget(
                          label: 'Nome de usuário',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FormFieldWidget(
                          label: 'Senha',
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
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
