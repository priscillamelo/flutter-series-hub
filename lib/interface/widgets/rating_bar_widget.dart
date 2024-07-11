import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'customs/colors.dart';

class RatingBarWidget extends StatelessWidget {
  final double ratingMovie;
  const RatingBarWidget({super.key, required this.ratingMovie});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 24,
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rate_rounded,
        color: ColorsTheme.bgTabSelected,
      ),
      onRatingUpdate: (rating) {
        rating = ratingMovie;
        debugPrint(rating.toString());
      },
    );
  }
}
