import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/text_form_dados_widget.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistindo.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FormSerieWidget extends StatefulWidget {
  final String categoriaPertencente;

  const FormSerieWidget({super.key, required this.categoriaPertencente});

  @override
  State<FormSerieWidget> createState() => _FormSerieWidgetState();
}

class _FormSerieWidgetState extends State<FormSerieWidget> {
  late SerieRepository serieRepository;

  final _formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final temporadaAtualController = TextEditingController();
  final diretorController = TextEditingController();
  final generoController = TextEditingController();
  final elencoController = TextEditingController();
  final anoLancamentoController = TextEditingController();
  final anoFinalizadaController = TextEditingController();
  final streamingController = TextEditingController();
  final sinopseController = TextEditingController();
  final avaliacaoController = TextEditingController();
  final temporadasController = TextEditingController();
  final dataFinalizadaController = TextEditingController();
  String? posterPath;

  selectedImage() async {
    final ImagePicker imagePicker = ImagePicker();

    try {
      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() {
          posterPath = file.path;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    serieRepository = Provider.of<SerieRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adicionar Série',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            margin: const EdgeInsets.only(top: 56),
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      width: 100,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: ColorsTheme.bgTabSelected,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.upload_file_rounded,
                            size: 96,
                            color: ColorsTheme.bgInput,
                          ),
                          TextButton(
                            onPressed: () => selectedImage(),
                            child: const Text(
                              "Carregar poster",
                              style: TextStyle(
                                  fontSize: 24, color: ColorsTheme.bgInput),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  DadosFormFieldWidget(
                    label: 'Título',
                    controller: tituloController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (widget.categoriaPertencente == Assistindo.aba)
                    DadosFormFieldWidget(
                      label: 'Temporada Atual',
                      controller: temporadaAtualController,
                      keyboardType: TextInputType.number,
                    ),
                  if (widget.categoriaPertencente == Assistindo.aba)
                    const SizedBox(
                      height: 16,
                    ),
                  /* DadosFormFieldWidget(
                    label: 'Ano de Lançamento',
                    controller: anoLancamentoController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ), */
                  DadosFormFieldWidget(
                    label: 'Gênero',
                    controller: generoController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  /* DadosFormFieldWidget(
                    label: 'Diretor',
                    controller: diretorController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ), */
                  DadosFormFieldWidget(
                    label: 'Temporadas',
                    controller: temporadasController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  /* DadosFormFieldWidget(
                    label: 'Sinopse',
                    controller: sinopseController,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(
                    height: 16,
                  ), */
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (temporadasController.text.isEmpty) {
                int.parse(temporadasController.text = "1");
              }

              if (_formKey.currentState!.validate()) {
                Serie serie = Serie(
                  poster: posterPath,
                  titulo: tituloController.text,
                  genero: generoController.text,
                  //anoLancamento: int.parse(anoLancamentoController.text),
                  categoriaPertencente: widget.categoriaPertencente,
                  temporadas: int.parse(temporadasController.text),
                );
                serieRepository.addSerie(serie);

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
    );
  }
}
