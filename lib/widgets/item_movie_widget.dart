import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/filme.dart';
import '../routes/pages_routes.dart';
import '../services/repository/filme_repository.dart';

class ItemMovieWidget extends StatefulWidget {
  final Filme filme;
  final String nameTab;

  const ItemMovieWidget(
      {super.key, required this.filme, required this.nameTab});

  @override
  State<ItemMovieWidget> createState() => _ItemMovieWidgetState();
}

class _ItemMovieWidgetState extends State<ItemMovieWidget> {
  @override
  Widget build(BuildContext context) {
    final filmeRepository = Provider.of<FilmeRepository>(context);
    return GestureDetector(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            widget.filme.titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(widget.filme.anoLancamento.toString()),
            ],
          ),
          trailing: Text(widget.filme.categoriaPertencente.toString()),
          /* leading: Image.network(
            pokemon.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ), */
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, PagesRoutes.kUPDATE_MOVIE_SERIE,
            arguments: widget.filme.id.toString());
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Deseja Excluir ${widget.filme.titulo}?"),
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
                        onPressed: () async {
                          final int numberRowsAffected;
                          numberRowsAffected = await filmeRepository
                              .deleteMovie(widget.filme.id);
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
            });
      },
    );
  }
}
