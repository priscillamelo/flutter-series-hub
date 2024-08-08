import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';

class AlertDialogWidgetCustom extends StatelessWidget {
  final Serie data;
  const AlertDialogWidgetCustom({super.key, required this.data});

  String moveDataTab() {
    return " ";
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.popAndPushNamed(context, PagesRoutes.kUPDATE_SERIE,
                    arguments: data.id);
              },
            ),
            const Divider(
              height: 8,
            ),
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
                                await _onDelete(
                                    context: context,
                                    repository: serieRepository);
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

  _onDelete({
    required SerieRepository repository,
    required BuildContext context,
  }) async {
    final int numberRowsAffected;
    numberRowsAffected = await repository.deleteSerie(data.id);

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
