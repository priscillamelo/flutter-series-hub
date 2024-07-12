import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/radio_options_register_widget.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';

class AlertDialogWidget extends StatefulWidget {
  final String nameTab;
  const AlertDialogWidget({super.key, required this.nameTab});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  String valueOption = "Filme";
  ValuesRegister? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("O que deseja adicionar?"),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: OptionsRegister(
                onOptionSelected: (value) {
                  setState(() {
                    _selectedOption = value;
                    _selectedOption.toString().contains("serie")
                        ? valueOption = "Série"
                        : valueOption = 'Filme';
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, PagesRoutes.kADD_MOVIE_SERIE, arguments: {
                      'nameTab': widget.nameTab,
                      'typeData': valueOption
                    });
                  },
                  child: const Text("Prosseguir"),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
