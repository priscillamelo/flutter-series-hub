import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/snackbar_widget.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/text_form_dados_widget.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
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
  final generoController = TextEditingController();
  final diretorController = TextEditingController();
  final temporadasController = TextEditingController();
  final sinopseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    serieRepository = Provider.of<SerieRepository>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const Text(
              'Adicionar Série',
              style: TextStyle(
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
                        label: 'Temporadas',
                        controller: temporadasController,
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
                  Serie serie = Serie(
                    tituloController.text,
                    int.parse(temporadasController.text),
                    categoriaPertencente: widget.categoriaPertencente,
                  );
                  debugPrint(serie.categoriaPertencente);
                  serieRepository.addSerie(serie);

                  //TODO: CRIAR COMPONENTE DE SNACKBAR
                  showSnackBar(
                      context: context,
                      text: "${serie.titulo} adicionado com sucesso",
                      isError: false);
                  /* ScaffoldMessenger.of(context).showSnackBar(

                    SnackBar(
                      content: Text("${serie.titulo} adicionado no banco"),
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
            const SizedBox(
              height: 32,
            ),
          ]),
        ),
      ),
    );
  }
}
