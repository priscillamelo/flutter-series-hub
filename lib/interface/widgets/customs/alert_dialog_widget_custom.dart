import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';
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
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: const Color.fromARGB(255, 237, 246, 249),
      title: const Text("Ação a ser executada:"),
      actions: [
        Column(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.edit_rounded),
              label: const Text(
                "Editar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(232, 253, 232, 139)),
                elevation: WidgetStatePropertyAll(2),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, PagesRoutes.kUPDATE_MOVIE_SERIE,
                    arguments: data);
              },
            ),
            /* _buildActionRow(
              icon: Icons.edit_rounded,
              text: "Editar",
              onPressed: () =>
                  Navigator.popAndPushNamed(context, '/update-movie-serie'),
            ), */
            const Divider(
              height: 8,
            ),
            /* TextButton.icon(
                icon: const Icon(Icons.subdirectory_arrow_left_rounded),
                label: const Text("Mover para..."),
                onPressed: () async {
                  //final String selectedTab;
                  //selectedTab = moveDataTab();
        
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
                }), */
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red.shade300),
                elevation: const WidgetStatePropertyAll(2),
              ),
              label: const Text(
                "Deletar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 237, 246, 249),
                      title: Text("Deseja excluir ${data.titulo}?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  ColorsTheme.bgInput,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Não"),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.red.shade300),
                              ),
                              onPressed: () async {
                                dynamic repository;
                                if (typeData == "filme") {
                                  repository = filmeRepository;
                                } else {
                                  repository = serieRepository;
                                }
                                await _onDelete(
                                    context: context, repository: repository);
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Sim",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                color: Colors.white,
                Icons.delete_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
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

  _onDelete({
    required dynamic repository,
    required BuildContext context,
  }) async {
    final int numberRowsAffected;
    if (typeData == "filme") {
      numberRowsAffected = await repository.deleteMovie(data.id);
    } else {
      numberRowsAffected = await repository.deleteSerie(data.id);
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
