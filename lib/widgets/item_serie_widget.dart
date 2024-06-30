import 'package:flutter/material.dart';

import '../models/serie.dart';

class ItemSerieWidget extends StatelessWidget {
  final Serie serie;

  const ItemSerieWidget({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            serie.titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(serie.anoLancamento.toString()),
            ],
          ),
          trailing: Text(serie.categoriaPertencente.toString()),
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
        //Provider.of<MovieProvider>(context, listen: false).removeMovie(serie);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "${serie.titulo} lançado em ${serie.anoLancamento} excluído com sucesso"),
          ),
        );
      },
    );
  }
}
