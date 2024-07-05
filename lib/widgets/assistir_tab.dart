import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistir.dart';
import 'package:flutter_journal_moviesandseries/widgets/floating_button_widget.dart';
import 'package:provider/provider.dart';

import '../routes/pages_routes.dart';
import '../services/repository/filme_repository.dart';
import 'item_movie_widget.dart';

class AssistirTab extends StatefulWidget {
  const AssistirTab({super.key});

  @override
  State<AssistirTab> createState() => _AssistirTabState();
}

class _AssistirTabState extends State<AssistirTab> {
  @override
  Widget build(BuildContext context) {
    final filmeRepository = Provider.of<FilmeRepository>(context);
    return FutureBuilder(
      future: filmeRepository.getAllMovies(),
      builder: (context, snapshot) {
        if (snapshot.data?.isEmpty ?? true) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingButtonWidget(
                  heroTagName: 'route-add-1',
                  routeName: PagesRoutes.kADD_MOVIE_SERIE,
                  nameTab: Assistir.aba,
                ),
                Text("Inicie seus registros!"),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ItemMovieWidget(
                    filme: snapshot.data![index],
                    nameTab: Assistir.aba,
                  );
                }),
            floatingActionButton: const FloatingButtonWidget(
              heroTagName: 'route-add-2',
              routeName: PagesRoutes.kADD_MOVIE_SERIE,
              nameTab: Assistir.aba,
            ),
          );
        }
      },
    );
  }
}

/* List<Filme> listFilmes = [];

      for (Map i in listMap) {
        listFilmes.add(Filme.fromMap(i));
      } */