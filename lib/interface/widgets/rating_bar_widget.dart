import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  final double ratingMovie;
  const RatingBarWidget({super.key, required this.ratingMovie});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.favorite,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        rating = ratingMovie;
        debugPrint(rating.toString());
      },
    );
  }
}
