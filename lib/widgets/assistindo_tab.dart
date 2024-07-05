import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistindo.dart';
import 'package:flutter_journal_moviesandseries/provider/movie_provider.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';
import 'package:flutter_journal_moviesandseries/widgets/floating_button_widget.dart';
import 'package:provider/provider.dart';

import 'item_serie_widget.dart';

class AssistindoTabWidget extends StatefulWidget {
  const AssistindoTabWidget({super.key});

  @override
  State<AssistindoTabWidget> createState() => _AssistindoTabMainState();
}

class _AssistindoTabMainState extends State<AssistindoTabWidget> {
  //late Future<List<Filme>> _listRegistrosAssistindo;
  late MovieProvider movieProvider;

  @override
  Widget build(BuildContext context) {
    movieProvider = Provider.of<MovieProvider>(context);

/*     List<Serie> listSeries = [];

    // TODO: MUDAR O PROVIDER PARA DE SERIES
    for (var serie in movieProvider.getAllSeries) {
      if (serie.categoriaPertencente == Assistindo.aba) {
        listSeries.add(serie);
      }
    }
    Assistindo().setListSeries = listSeries; */
    return Consumer<MovieProvider>(builder: (context, movieProvider, child) {
      return Assistindo().getListSeries.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingButtonWidget(
                    heroTagName: '',
                    routeName: PagesRoutes.kADD_MOVIE_SERIE,
                    nameTab: Assistindo.aba,
                  ),
                  Text("Inicie seus registros!"),
                ],
              ),
            )
          : Scaffold(
              body: ListView.builder(
                itemCount: Assistindo().getListSeries.length,
                itemBuilder: (context, index) {
                  return ItemSerieWidget(
                    serie: Assistindo().getListSeries.elementAt(index),
                  );
                },
              ),
              floatingActionButton: const FloatingButtonWidget(
                heroTagName: '',
                routeName: PagesRoutes.kADD_MOVIE_SERIE,
                nameTab: Assistindo.aba,
              ),
            );
    });
    /*FutureBuilder(
        future: listMovies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar seus registros'),
            );
          } else if (snapshot.data != null && snapshot.data!.isNotEmpty) {
            return Scaffold(
              body: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return RegistroItem(
                    filme: snapshot.data![index],
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PagesRoutes.kADD_MOVIE_SERIE,
                    );
                  },
                  child: const Icon(Icons.add)),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO: CRIAR COMPONENTE DE FLOATING BUTTON
                  FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          PagesRoutes.kADD_MOVIE_SERIE,
                        );
                      },
                      child: const Icon(Icons.add)),
                  const Text("Inicie seus registros!"),
                ],
              ),
            );
          }
        });*/
  }
}
