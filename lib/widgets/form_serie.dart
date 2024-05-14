import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/widgets/customs/text_form_dados_widget.dart';

class FormSerie extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  FormSerie({super.key});

  final formKey = FormSerie()._formKey;
  final tituloController = TextEditingController();
  final diretorController = TextEditingController();
  final generoController = TextEditingController();
  final elencoController = TextEditingController();
  final anoLancamentoController = TextEditingController();
  final streamingController = TextEditingController();
  final sinopseController = TextEditingController();
  final avaliacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
          /* FormFieldWidget(
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
          DadosFormFieldWidget(
            label: 'Ano de Lancamento',
            controller: anoLancamentoController,
            keyboardType: TextInputType.number,
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
                      ), */
        ],
      ),
    );
  }
}
