import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/rating_bar_widget.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/rich_text_widget.dart';

// MODEL
import '../../models/serie.dart';

class ItemSerieWidget extends StatefulWidget {
  final Serie serie;
  final String nameTab;

  const ItemSerieWidget(
      {super.key, required this.serie, required this.nameTab});

  @override
  State<ItemSerieWidget> createState() => _ItemSerieWidgetState();
}

class _ItemSerieWidgetState extends State<ItemSerieWidget> {
  @override
  Widget build(BuildContext context) {
    final Serie serie = widget.serie;
    return GestureDetector(
      child: Card(
        color: ColorsTheme.bgCardDetails,
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: LayoutBuilder(builder: (context, constraints) {
            final double availableHeight = constraints.maxHeight;
            final double desiredHeight = availableHeight / 1.5;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: constraints.maxWidth / 3,
                        alignment: Alignment.center,
                        child: Image.asset(
                          serie.poster != null
                              ? "${serie.poster}"
                              : "assets/no_image.png",
                          //width: constraints.maxWidth / 4,
                          height: desiredHeight,
                          semanticLabel: "Poster",
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                        ),
                      ),
                      RatingBarWidget(ratingMovie: serie.avaliacao),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichTextWidget(
                        propertie: "Título",
                        propertieValue: serie.titulo,
                      ),
                      RichTextWidget(
                        propertie: "Gênero",
                        propertieValue: serie.genero,
                      ),
                      RichTextWidget(
                        propertie: "Temporadas",
                        propertieValue: serie.temporadas.toString(),
                      ),
                      RichTextWidget(
                        propertie: "Atores Principais",
                        propertieValue: serie.elenco,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: constraints.maxWidth / 4.5,
                    height: desiredHeight * 1.3,
                    color: ColorsTheme.bgTabSelected,
                    child: RichTextWidget(
                      propertie: "Sinopse",
                      propertieValue: serie.sinopse,
                    ),
                  ),
                ],
              ),
            );
          }),
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
                "${widget.serie.titulo} lançado em ${widget.serie.anoLancamento} excluído com sucesso"),
          ),
        );
      },
    );
  }
}
