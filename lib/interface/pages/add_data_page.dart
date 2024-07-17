import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/form_serie_widget.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    final nameTab = arguments['nameTab'];
    //final typeData = arguments['typeData'];

    return Scaffold(
      body: FormSerieWidget(categoriaPertencente: nameTab),
    );
  }
}
