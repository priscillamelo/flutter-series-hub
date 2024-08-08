import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'customs/colors.dart';

class RatingBarWidget extends StatefulWidget {
  final Serie data;
  final double sizeIcon;
  const RatingBarWidget(
      {super.key, required this.data, required this.sizeIcon});

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    final SerieRepository serieRepository =
        Provider.of<SerieRepository>(context);

    return RatingBar.builder(
      itemSize: widget.sizeIcon,
      initialRating: widget.data.avaliacao,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rate_rounded,
        color: ColorsTheme.bgTabSelected,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          widget.data.avaliacao = rating;
          serieRepository.updateSerie(widget.data);
        });
      },
    );
  }
}
