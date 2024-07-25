import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/filme_repository.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';

class AlertDialogWidgetCustom extends StatelessWidget {
  final dynamic data;
  final String typeData;
  const AlertDialogWidgetCustom(
      {super.key, required this.data, required this.typeData});

  String moveDataTab() {
    return " ";
  }

  @override
  Widget build(BuildContext context) {
    FilmeRepository filmeRepository = FilmeRepository();
    SerieRepository serieRepository = SerieRepository();

    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 237, 246, 249),
      title: const Text("Ação a ser executada:"),
      actions: [
        Column(
          children: [
            /* _buildActionRow(
                icon: Icons.edit_rounded, text: "Editar", onPressed: () {}),
            const Divider(
              height: 8,
            ), */
            TextButton.icon(
                icon: const Icon(Icons.subdirectory_arrow_left_rounded),
                label: const Text("Mover para..."),
                onPressed: () async {
                  final String selectedTab;
                  selectedTab = moveDataTab();

                  if (typeData == "filme") {
                    Filme filme = data;
                    await filmeRepository.updateMovie(filme);
                  } else {
                    Serie serie = data;
                    await serieRepository.updateSerie(serie);
                  }
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green.shade400,
                        content: Text(
                            "${data.titulo} movido para ${data.categoriaPertencente} com sucesso"),
                      ),
                    );
                  }
                }),
            const Divider(
              height: 8,
            ),
            TextButton.icon(
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
                      duration: Duration(seconds: 2),
                      content: Text("Erro no processo de exclusão!"),
                    ),
                  );
                }
                Navigator.pop(context);
              },
              label: const Text("Deletar"),
              icon: const Icon(Icons.delete_forever_rounded),
            ),
          ],
        ),
        TextButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ColorsTheme.bgInput),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
      ],
    );
  }

  Widget _buildActionRow({
    required IconData icon,
    required String text,
    required Function() onPressed,
    bool isDestructive = false, // Optional for visual distinction
  }) {
    return TextButton.icon(
      icon: Icon(icon,
          color: isDestructive
              ? Colors.red
              : null), // Optional color for destructive actions
      label: Text(text),
      onPressed: onPressed(),
    );
  }
}

 /* TextButton(
              style: const ButtonStyle(
                textStyle: WidgetStatePropertyAll(
                  TextStyle(color: ColorsTheme.bgInputDetails),
                ),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(132, 0, 109, 119)),
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
            ), */
