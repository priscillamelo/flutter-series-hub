import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistir.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';
import '../routes/pages_routes.dart';
import 'assistindo_tab.dart';

class AssistirTab extends StatefulWidget {
  const AssistirTab({super.key});

  @override
  State<AssistirTab> createState() => _AssistirTabState();
}

class _AssistirTabState extends State<AssistirTab> {
  late MovieProvider movieProvider;

  @override
  Widget build(BuildContext context) {
    movieProvider = Provider.of<MovieProvider>(context);
    List<Filme> listMovies = [];

    for (var movie in movieProvider.getAllMovies) {
      if (movie.categoriaPertencente == Assistir.aba) {
        listMovies.add(movie);
      }
    }
    Assistir().setListMovies = listMovies;
    return Consumer<MovieProvider>(builder: (context, movieProvider, child) {
      if (Assistir().getListMovies.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: CRIAR COMPONENTE DE FLOATING BUTTON
              FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PagesRoutes.kADD_MOVIE_SERIE,
                        arguments: Assistir.aba);
                  },
                  child: const Icon(Icons.add)),
              const Text("Inicie seus registros!"),
            ],
          ),
        );
      } else {
        return Scaffold(
          body: ListView.builder(
            itemCount: Assistir().getListMovies.length,
            itemBuilder: (context, index) {
              return RegistroItem(
                filme: Assistir().getListMovies.elementAt(index),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, PagesRoutes.kADD_MOVIE_SERIE,
                    arguments: Assistir.aba);
              },
              child: const Icon(Icons.add)),
        );
      }
    });
  }
}
