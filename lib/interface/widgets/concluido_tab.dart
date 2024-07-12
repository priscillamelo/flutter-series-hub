import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    //List<Serie> listSeries = [];

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
  }
}
