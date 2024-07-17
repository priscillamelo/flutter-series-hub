import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
// FIREBASE
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// PROVIDER
import 'package:provider/provider.dart';
// ROUTES
import 'routes/pages_routes.dart';
import 'routes/user_route.dart';
// SERVICE
import 'services/repository/filme_repository.dart';
// INTERFACE - UI
import 'interface/pages/add_data_page.dart';
import 'interface/pages/criar_conta_page.dart';
import 'interface/pages/home_page.dart';
import 'interface/pages/login_page.dart';
import 'interface/pages/update_data_page.dart';
// VALUES
import 'interface/widgets/customs/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => FilmeRepository(),
      ),
      ChangeNotifierProvider(
        create: (_) => SerieRepository(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Projetos Aplicados I',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsTheme.bgTela,
        colorScheme: ColorScheme.fromSeed(
            seedColor: ColorsTheme.bgTela, primary: ColorsTheme.bgTela),
        useMaterial3: true,
      ),
      routes: {
        PagesRoutes.kLOGIN_PAGE: (context) => const LoginPage(),
        PagesRoutes.kCREATE_ACCOUNT: (context) => const CriarContaPage(),
        PagesRoutes.kHOME: (context) => const HomePage(),
        PagesRoutes.kADD_MOVIE_SERIE: (context) => const AddDataPage(),
        PagesRoutes.kUPDATE_MOVIE_SERIE: (context) => const UpdateDataPage(),
      },
      home: const DefaultTabController(
        length: 3,
        child: UserRoute(),
      ),
    );
  }
}
