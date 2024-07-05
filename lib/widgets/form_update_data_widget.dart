import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/abas/tab_types.dart';
import '../models/filme.dart';
import '../services/repository/filme_repository.dart';
import 'customs/text_form_dados_widget.dart';

class FormUpdateDataWidget extends StatefulWidget {
  final String categoriaPertencente;
  final String idFilme;
  const FormUpdateDataWidget({
    super.key,
    required this.categoriaPertencente,
    required this.idFilme,
  });

  @override
  State<FormUpdateDataWidget> createState() => _FormUpdateDataWidget();
}

class _FormUpdateDataWidget extends State<FormUpdateDataWidget> {
  //late MovieProvider movieProvider;
  //late FilmeRepository filmeRepository;
  //ValuesRegister? _selectedOption;
  // para armazenar o valor do RadioButton selecionado
  String valueOption = "Filme";
  int idFilme = 0;

  final _formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final generoController = TextEditingController();
  final diretorController = TextEditingController();
  final anoLancamentoController = TextEditingController();
  final sinopseController = TextEditingController();

  //final elencoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    idFilme = int.parse(widget.idFilme);
    String tabName = widget.categoriaPertencente;

    final filmeRepository = Provider.of<FilmeRepository>(context);
    return FutureBuilder(
        future: filmeRepository.getFilmeById(idFilme),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        tabName.toLowerCase() == TabTypes.assistindo.name
                            ? 'Atualizar Série'
                            : 'Atualizar $valueOption',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Adicione outras widgets aqui
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
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Filme filme = snapshot.data;
                                      debugPrint(filme.id.toString());
                                      debugPrint(filme.titulo);

                                      filme = Filme(
                                        tituloController.text,
                                        int.parse(anoLancamentoController.text),
                                        categoriaPertencente:
                                            widget.categoriaPertencente,
                                      );
                                      filmeRepository.updateMovie(filme);

                                      debugPrint(tituloController.text);

                                      debugPrint(filme.titulo);

                                      /* //TODO: CRIAR COMPONENTE DE SNACKBAR
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "${filme.titulo} adicionado no banco"),
                                        ),
                                      ); */
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
                              ],
                            ),
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
              /* if (tabName.toLowerCase() != TabTypes.assistindo.name)
              OptionsRegister(
                onOptionSelected: (value) {
                  setState(() {
                    _selectedOption = value;
                    _selectedOption.toString().contains("serie")
                        ? valueOption = "Série"
                        : valueOption = 'Filme';
                  });
                },
              ), */
              // Outras widgets que você deseja exibir sempre

              /* tituloController =
                              TextEditingController(text: filme!.titulo);
                          generoController = TextEditingController();
                          diretorController = TextEditingController();
                          anoLancamentoController = TextEditingController();
                          sinopseController = TextEditingController(); */
              //tituloController.text = filme!.titulo;
              /*generoController.text = (filme.genero ?? "");
                          diretorController.text = (filme.diretor ?? "");
                          anoLancamentoController.text =
                              filme.anoLancamento.toString();
                          sinopseController.text = (filme.sinopse ?? ""); */
            );
          } else {
            return AlertDialog();
          }
        });
  }
}
/* 




if (tabName != TabTypes.assistindo) {
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
                } */