import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/assistindo_tab_widget.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/assistir_tab_widget.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/concluido_tab_widget.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/search_delegate_custom.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
import 'package:provider/provider.dart';

// WIDGET
import '../widgets/customs/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Serie> listSeries;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serieRepository = Provider.of<SerieRepository>(context);
    final Future<List<Serie>> listDatas = serieRepository.getAllSeries();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
              iconSize: 50,
            ),
            Image.asset(
              'assets/logo_app.png',
              fit: BoxFit.fill,
              height: 80,
              semanticLabel: "Logo do App - My Journal Digital",
            ),
            IconButton(
              onPressed: () async {
                listSeries = await listDatas;

                if (!context.mounted) return;
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(listSeries),
                );
              },
              icon: const Icon(Icons.search),
              iconSize: 32,
            ),
          ],
        ),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: ColorsTheme.bgInput,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: TabBar(
              dividerHeight: 0,
              controller: _tabController,
              indicator: BoxDecoration(
                color: ColorsTheme.bgTabSelected,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              indicatorPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: -16),
              labelStyle: const TextStyle(
                color: ColorsTheme.bgInput,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.normal,
              ),
              unselectedLabelStyle: const TextStyle(
                backgroundColor: Colors.transparent,
                fontWeight: FontWeight.bold,
              ),
              splashBorderRadius: BorderRadius.circular(50),
              tabs: const [
                Tab(
                  text: 'Quero Assistir',
                ),
                Tab(
                  text: 'Estou Assistindo',
                ),
                Tab(
                  text: 'Já Finalizei',
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        AssistirTabWidget(),
        AssistindoTabWidget(),
        ConcluidoTabWidget()
      ]),
    );
  }
}
