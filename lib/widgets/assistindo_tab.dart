import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/abas/assistindo.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:flutter_journal_moviesandseries/provider/movie_provider.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';
import 'package:provider/provider.dart';

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
                          arguments: Assistindo.aba,
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
                  return RegistroItem(
                    filme: movieProvider.getAllMovies[index],
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PagesRoutes.kADD_MOVIE_SERIE,
                      arguments: Assistindo.aba,
                    );
                  },
                  child: const Icon(Icons.add)),
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

class RegistroItem extends StatelessWidget {
  final Filme filme;
  // final FilmeDao? filmeDao;
  const RegistroItem({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            filme.titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(filme.anoLancamento.toString()),
            ],
          ),
          trailing: Text(filme.categoriaPertencente.toString()),
          /* leading: Image.network(
            pokemon.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ), */
        ),
      ),
      /* onTap: () {
        print(pokemon.nome);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TelaDetalhesPokemon(id: pokemon.id, dao: dao),
          ),
        );
      }, */
      onLongPress: () {
        //movieProvider.removeMovie(filme);
        Provider.of<MovieProvider>(context, listen: false).removeMovie(filme);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "${filme.titulo} lançado em ${filme.anoLancamento} excluído com sucesso"),
          ),
        );
      },
    );
  }
}
