import 'package:flutter/material.dart';
// ROUTE
import '../../routes/pages_routes.dart';
// MODEL
import '../../models/abas/assistindo.dart';
// WIDGET
import 'floating_button_widget.dart';

class HomeNoDataWidget extends StatelessWidget {
  const HomeNoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingButtonWidgetLarge(
            heroTagName: '',
            routeName: PagesRoutes.kADD_MOVIE_SERIE,
            nameTab: Assistindo.aba,
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Inicie sua lista de filmes e séries!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
