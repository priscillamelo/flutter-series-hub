import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/widgets/radio_options_register_widget.dart';
import 'package:flutter_journal_moviesandseries/widgets/text_form_field_widgets.dart';

class AddMovieOrSeriePage extends StatelessWidget {
  const AddMovieOrSeriePage({super.key});

  @override
  Widget build(BuildContext context) {
    //print(valueOption);
    return const Scaffold(
      body: FormAddMovieOrSerie(),
    );
  }
}

class FormAddMovieOrSerie extends StatefulWidget {
  const FormAddMovieOrSerie({super.key});

  @override
  State<FormAddMovieOrSerie> createState() => _FormAddMovieOrSerie();
}

class _FormAddMovieOrSerie extends State<FormAddMovieOrSerie> {
  final _formKey = GlobalKey<FormState>();

  final tituloController = TextEditingController();
  final diretorController = TextEditingController();
  final generoController = TextEditingController();
  final elencoController = TextEditingController();
  final anoLancamentoController = TextEditingController();
  final streamingController = TextEditingController();
  final sinopseController = TextEditingController();
  final avaliacaoController = TextEditingController();

  ValuesRegister?
      _selectedOption; // para armazenar o valor do RadioButton selecionado
  String valueOption = 'Filme';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OptionsRegister(
                onOptionSelected: (value) {
                  setState(() {
                    _selectedOption =
                        value; // Atualize o valor do RadioButton selecionado
                    _selectedOption.toString().contains('serie')
                        ? valueOption = 'Série'
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
                width: MediaQuery.of(context).size.width / 1.4,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormFieldWidget(
                        label: 'Título',
                        controller: tituloController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FormFieldWidget(
                        label: 'Diretor',
                        controller: diretorController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FormFieldWidget(
                        label: 'Gênero',
                        controller: generoController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FormFieldWidget(
                        label: 'Elenco',
                        controller: elencoController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FormFieldWidget(
                        label: 'Ano de Lancamento',
                        controller: anoLancamentoController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FormFieldWidget(
                        label: 'Avaliação',
                        controller: avaliacaoController,
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
                  if (_formKey.currentState!.validate()) {}
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
              /* TextButton(
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
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
