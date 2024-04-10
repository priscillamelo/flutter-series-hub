import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/widgets/text_form_field.dart';

class CriarContaPage extends StatelessWidget {
  const CriarContaPage({super.key});

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
                  'Criar Conta',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: const Form(
                    child: Column(
                      children: [
                        FormFieldWidget(
                          label: 'Nome',
                          icon: Icon(Icons.account_circle),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FormFieldWidget(
                          label: 'Sobrenome',
                          icon: Icon(Icons.account_box),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FormFieldWidget(
                          label: 'Nome de usuário',
                          icon: Icon(Icons.account_circle),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FormFieldWidget(
                          label: 'E-mail',
                          icon: Icon(Icons.email),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FormFieldWidget(
                          label: 'Senha',
                          icon: Icon(Icons.password),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FormFieldWidget(
                          label: 'Confirmar senha',
                          icon: Icon(Icons.password),
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
                    textStyle: MaterialStateProperty.all(
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
