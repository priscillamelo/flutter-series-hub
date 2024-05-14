import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/widgets/assistindo_tab.dart';
import 'package:flutter_journal_moviesandseries/widgets/customs/colors.dart';

import '../widgets/assistir_tab.dart';
import '../widgets/concluido_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Image.asset('assets/logo_app.png'),
        centerTitle: true,
        /* leading: const Icon(
          Icons.account_circle,
          size: 50,
        ),
        leadingWidth: 100, */
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: ColorsTheme.bgTabSelected,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          indicatorPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: -16),
          labelStyle: const TextStyle(
            color: ColorsTheme.bgInput,
            decoration: TextDecoration.underline,
          ),
          unselectedLabelStyle: const TextStyle(
            backgroundColor: Colors.transparent,
          ),
          splashBorderRadius: BorderRadius.circular(50),
          tabs: const [
            Tab(
              text: 'Assistindo',
            ),
            Tab(
              text: 'Assistir',
            ),
            Tab(
              text: 'Concluído',
            )
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        AssistindoTabWidget(),
        AssistirTab(),
        ConcluidoTab()
      ]),
    );
  }
}
