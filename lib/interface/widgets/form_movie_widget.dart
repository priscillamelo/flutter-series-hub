import 'package:flutter/material.dart';
// PROVIDER
import 'package:provider/provider.dart';

import '../../models/abas/tab_types.dart';
// MODEL
import '../../models/filme.dart';
// SERVICE
import '../../services/repository/filme_repository.dart';
// WIDGETS

class FormMovieWidget extends StatefulWidget {
  final String categoriaPertencente;
  const FormMovieWidget({super.key, required this.categoriaPertencente});

  @override
  State<FormMovieWidget> createState() => _FormMovieWidget();
}

class _FormMovieWidget extends State<FormMovieWidget> {
  late FilmeRepository filmeRepository;

  final _formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final generoController = TextEditingController();
  final diretorController = TextEditingController();
  final anoLancamentoController = TextEditingController();
  final sinopseController = TextEditingController();
  //final elencoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String tabName = widget.categoriaPertencente;
    filmeRepository = Provider.of<FilmeRepository>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const Text(
              'Adicionar Filme',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            if (tabName.toLowerCase() != TabTypes.assistindo.name)
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        /* children: [
                        DadosFormFieldWidget(
                          label: 'Título',
                          controller: tituloController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DadosFormFieldWidget(
                          label: 'Gênero',
                          controller: generoController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DadosFormFieldWidget(
                          label: 'Diretor',
                          controller: diretorController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DadosFormFieldWidget(
                          label: 'Ano de Lançamento',
                          controller: anoLancamentoController,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DadosFormFieldWidget(
                          label: 'Sinopse',
                          controller: sinopseController,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ], */
                        ),
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Filme filme = Filme(
                    tituloController.text,
                    int.parse(anoLancamentoController.text),
                    categoriaPertencente: widget.categoriaPertencente,
                  );
                  filmeRepository.addFilme(filme);
                  debugPrint(filme.categoriaPertencente);

                  //movieProvider.saveMovie(filme);
                  //TODO: CRIAR COMPONENTE DE SNACKBAR
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${filme.titulo} adicionado no banco"),
                    ),
                  );
                  Navigator.pop(context);
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
                "Adicionar à lista",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ]),
        ),
      ),
    );
  }
}
