import 'package:flutter/material.dart';

import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:flutter_journal_moviesandseries/services/repository/filme_repository.dart';
import 'package:flutter_journal_moviesandseries/widgets/customs/text_form_dados_widget.dart';
import 'package:flutter_journal_moviesandseries/widgets/radio_options_register_widget.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class AddMovieOrSeriePage extends StatelessWidget {
  const AddMovieOrSeriePage({super.key});

  @override
  Widget build(BuildContext context) {
    Object title = ModalRoute.of(context)!.settings.arguments.toString();
    debugPrint(title.toString());
    return Scaffold(
      body: FormAddMovieOrSerie(categoriaPertencente: title.toString()),
    );
  }
}

class FormAddMovieOrSerie extends StatefulWidget {
  final String categoriaPertencente;
  const FormAddMovieOrSerie({super.key, required this.categoriaPertencente});

  @override
  State<FormAddMovieOrSerie> createState() => _FormAddMovieOrSerie();
}

class _FormAddMovieOrSerie extends State<FormAddMovieOrSerie> {
  late MovieProvider movieProvider;
  late FilmeRepository filmeRepository;
  ValuesRegister? _selectedOption;
  // para armazenar o valor do RadioButton selecionado
  String valueOption = "Filme";

  final _formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final generoController = TextEditingController();
  final diretorController = TextEditingController();
  final anoLancamentoController = TextEditingController();
  final sinopseController = TextEditingController();
  //final elencoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    movieProvider = Provider.of<MovieProvider>(context);
    filmeRepository = Provider.of<FilmeRepository>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OptionsRegister(
                onOptionSelected: (value) {
                  setState(() {
                    // Atualize o valor do RadioButton selecionado
                    _selectedOption = value;
                    _selectedOption.toString().contains("serie")
                        ? valueOption = "Série"
                        : valueOption = 'Filme';
                  });
                },
              ),
              Text(
                'Adicionar $valueOption',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                      ],
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
                    movieProvider.saveMovie(filme);
                    //TODO: CRIAR COMPONENTE DE SNACKBAR
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Aba ${widget.categoriaPertencente}"),
                      ),
                    );
                    Navigator.pop(context);
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
                  "Adicionar à lista",
                  style: TextStyle(
                    fontSize: 24,
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
    );
  }
}
