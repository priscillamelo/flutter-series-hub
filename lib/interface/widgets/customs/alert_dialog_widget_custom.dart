import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:flutter_journal_moviesandseries/services/repository/filme_repository.dart';

class AlertDialogWidgetCustom extends StatelessWidget {
  final Filme filme;
  const AlertDialogWidgetCustom({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    FilmeRepository filmeRepository = FilmeRepository();
    return AlertDialog(
      title: Text("Deseja Excluir ${filme.titulo}?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red.shade600),
              ),
              child: const Text("Não"),
            ),
            ElevatedButton(
              onPressed: () async {
                final int numberRowsAffected;
                numberRowsAffected =
                    await filmeRepository.deleteMovie(filme.id);
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
