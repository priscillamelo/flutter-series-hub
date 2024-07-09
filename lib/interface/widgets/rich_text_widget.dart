import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String propertie;
  final String? propertieValue;
  const RichTextWidget(
      {super.key, required this.propertie, this.propertieValue = ""});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$propertie: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '$propertieValue',
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
