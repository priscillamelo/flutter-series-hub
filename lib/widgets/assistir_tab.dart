
import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistir.dart';
import 'package:provider/provider.dart';

import '../models/filme.dart';
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

    return Consumer<MovieProvider>(
        builder: (context, movieProvider, child){
          return movieProvider.getAllMovies.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: CRIAR COMPONENTE DE FLOATING BUTTON
                FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PagesRoutes.kADD_MOVIE_SERIE,
                        arguments: Assistir.aba
                      );
                    },
                    child: const Icon(Icons.add)),
                const Text("Inicie seus registros!"),
              ],
            ),
          )
              : Scaffold(
            body: ListView.builder(
              itemCount: movieProvider.getAllMovies.length,
              itemBuilder: (context, index) {
                List<Filme> listMovies = Assistir().listMovies;
                if(movieProvider.getAllMovies.elementAt(index)
                    .categoriaPertencente == Assistir.aba){
                  listMovies.add(movieProvider.getAllMovies.elementAt
                    (index));
                  return RegistroItem(
                    filme: listMovies.elementAt(index),
                  );
                }
                return null;
              },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PagesRoutes.kADD_MOVIE_SERIE,
                      arguments: Assistir.aba
                  );
                },
                child: const Icon(Icons.add)),
          );
        });
  }
}