import 'package:flutter/material.dart';

// PROVIDER
import 'package:provider/provider.dart';
import '../../provider/movie_provider.dart';
// MODEL
import '../../models/filme.dart';
import '../../models/abas/assistidos.dart';
// ROUTES
import '../../routes/pages_routes.dart';
// WIDGET
import 'floating_button_widget.dart';
import 'home_no_data_widget.dart';

import 'item_movie_widget.dart';

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
        return const HomeNoDataWidget(
          nameTab: Assistidos.aba,
        );
      } else {
        return Scaffold(
          body: ListView.builder(
            itemCount: Assistidos().getListMovies.length,
            itemBuilder: (context, index) {
              return ItemMovieWidget(
                filme: Assistidos().listMovies.elementAt(index),
                nameTab: Assistidos.aba,
              );
            },
          ),
          floatingActionButton: const FloatingButtonWidgetSmall(
            heroTagName: '',
            routeName: PagesRoutes.kADD_MOVIE_SERIE,
            nameTab: Assistidos.aba,
          ),
        );
      }
    });
  }
}
