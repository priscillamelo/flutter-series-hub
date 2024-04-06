import 'package:flutter/material.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    child: Column(
                      children: [
                        const Text(
                          'Fazer Login',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            labelText: "Nome de usuário",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            labelText: "Senha",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                    "Logar",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
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
