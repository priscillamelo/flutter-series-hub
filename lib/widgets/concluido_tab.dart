import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistidos.dart';
import 'package:provider/provider.dart';

import '../models/filme.dart';
import '../provider/movie_provider.dart';
import '../routes/pages_routes.dart';
import 'assistindo_tab.dart';

class ConcluidoTab extends StatefulWidget {
  const ConcluidoTab({super.key});

  @override
  State<ConcluidoTab> createState() => _ConcluidoTabState();
}

class _ConcluidoTabState extends State<ConcluidoTab> {
  late MovieProvider movieProvider;
  @override
  Widget build(BuildContext context) {
    movieProvider = Provider.of<MovieProvider>(context);

    //List<Serie> listSeries = [];
    List<Filme> listMovies = [];

    for (var movie in movieProvider.getAllMovies) {
      if (movie.categoriaPertencente == Assistidos.aba) {
        listMovies.add(movie);
      }
    }
    Assistidos().setListMovies = listMovies;
    return Consumer<MovieProvider>(builder: (context, movieProvider, child) {
      if (Assistidos().getListMovies.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: CRIAR COMPONENTE DE FLOATING BUTTON
              FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PagesRoutes.kADD_MOVIE_SERIE,
                        arguments: Assistidos.aba);
                  },
                  child: const Icon(Icons.add)),
              const Text("Inicie seus registros!"),
            ],
          ),
        );
      } else {
        return Scaffold(
          body: ListView.builder(
            itemCount: Assistidos().getListMovies.length,
            itemBuilder: (context, index) {
              return RegistroItem(
                filme: Assistidos().listMovies.elementAt(index),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, PagesRoutes.kADD_MOVIE_SERIE,
                    arguments: Assistidos.aba);
              },
              child: const Icon(Icons.add)),
        );
      }
    });
  }
}
