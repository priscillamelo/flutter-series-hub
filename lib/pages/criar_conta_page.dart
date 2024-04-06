import 'package:flutter/material.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
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
                          height: 32,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            labelText: "Nome",
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
                            labelText: "Sobrenome",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
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
                            labelText: "E-mail",
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
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            labelText: "Confirmar Senha",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
