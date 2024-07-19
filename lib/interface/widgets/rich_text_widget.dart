import 'package:flutter/material.dart';

import 'customs/colors.dart';

class RichTextWidget extends StatelessWidget {
  final String propertie;
  final String? propertieValue;
  const RichTextWidget(
      {super.key, required this.propertie, this.propertieValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsTheme.bgInputDetails,
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 3,
      child: RichText(
        softWrap: true,
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$propertie: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: propertieValue != null ? '$propertieValue' : " ",
              style: const TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
