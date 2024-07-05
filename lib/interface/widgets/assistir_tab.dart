import 'package:flutter/material.dart';

// PROVIDER
import 'package:provider/provider.dart';
// SERVICE
import '../../services/repository/filme_repository.dart';
// MODEL
import '../../models/abas/assistir.dart';
// ROUTES
import '../../routes/pages_routes.dart';
// WIDGET
import 'floating_button_widget.dart';
import 'home_no_data_widget.dart';

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
          return const HomeNoDataWidget();
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
            floatingActionButton: const FloatingButtonWidgetSmall(
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