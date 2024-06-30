import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/filme.dart';
import '../provider/movie_provider.dart';

class ItemMovieWidget extends StatelessWidget {
  final Filme filme;
  // final FilmeDao? filmeDao;
  const ItemMovieWidget({super.key, required this.filme});

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
