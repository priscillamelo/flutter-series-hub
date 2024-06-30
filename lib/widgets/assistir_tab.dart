import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistir.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:flutter_journal_moviesandseries/widgets/floating_button_widget.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';
import '../routes/pages_routes.dart';
import 'item_movie_widget.dart';

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
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingButtonWidget(
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
            itemCount: Assistir().getListMovies.length,
            itemBuilder: (context, index) {
              return ItemMovieWidget(
                filme: Assistir().getListMovies.elementAt(index),
              );
            },
          ),
          floatingActionButton: const FloatingButtonWidget(
            routeName: PagesRoutes.kADD_MOVIE_SERIE,
            nameTab: Assistir.aba,
          ),
        );
      }
    });
  }
}
