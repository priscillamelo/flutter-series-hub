import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/services/repository/filme_repository.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';

class AlertDialogWidgetCustom extends StatelessWidget {
  final dynamic data;
  final String typeData;
  const AlertDialogWidgetCustom(
      {super.key, required this.data, required this.typeData});

  @override
  Widget build(BuildContext context) {
    FilmeRepository filmeRepository = FilmeRepository();
    SerieRepository serieRepository = SerieRepository();
    return AlertDialog(
      title: Text("Deseja Excluir ${data.titulo}?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Não"),
            ),
            ElevatedButton(
              style: ButtonStyle(
                textStyle: const WidgetStatePropertyAll(
                  TextStyle(color: ColorsTheme.bgInput),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.red.shade600),
              ),
              onPressed: () async {
                final int numberRowsAffected;
                if (typeData == "filme") {
                  numberRowsAffected =
                      await filmeRepository.deleteMovie(data.id);
                } else {
                  numberRowsAffected =
                      await serieRepository.deleteSerie(data.id);
                }

                if (!context.mounted) return;
                if (numberRowsAffected != 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Deletado com sucesso"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Erro no processo de exclusão!"),
                    ),
                  );
                }
                Navigator.pop(context);
              },
              child: const Text("Sim"),
            ),
          ],
        ),
      ],
    );
  }
}
