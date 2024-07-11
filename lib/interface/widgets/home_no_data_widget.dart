import 'package:flutter/material.dart';

// ROUTE
import '../../routes/pages_routes.dart';
// WIDGET
import 'floating_button_widget.dart';

class HomeNoDataWidget extends StatelessWidget {
  final String nameTab;
  const HomeNoDataWidget({super.key, required this.nameTab});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingButtonWidgetLarge(
            heroTagName: '',
            routeName: PagesRoutes.kADD_MOVIE_SERIE,
            nameTab: nameTab,
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
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
