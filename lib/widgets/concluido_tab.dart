
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
    //Future<List<Filme>> listMovies = movieProvider.getAllMovies as
    // Future<List<Filme>>;
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
                        arguments: Assistidos.aba,
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
                List<Filme> listMovies = Assistidos().listMovies;
                if(movieProvider.getAllMovies.elementAt(index)
                    .categoriaPertencente == Assistidos.aba){
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
                    arguments: Assistidos.aba,
                  );
                },
                child: const Icon(Icons.add)),
          );
        });
  }
}