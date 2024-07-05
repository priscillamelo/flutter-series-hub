// FIREBASE
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/provider/movie_provider.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';
import 'package:flutter_journal_moviesandseries/services/repository/filme_repository.dart';
// WIDGETS
import 'package:flutter_journal_moviesandseries/widgets/customs/colors.dart';
import 'package:provider/provider.dart';

// PAGES
import 'firebase_options.dart';
import 'pages/add_data_page.dart';
import 'pages/criar_conta_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/update_data_page.dart';
import 'routes/user_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MovieProvider>(
        create: (_) => MovieProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => FilmeRepository(),
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
        //scaffoldBackgroundColor: ColorsTheme.bgTela,
        /* buttonTheme: const ButtonThemeData(
            buttonColor: ColorsTheme.bgInputDetails,
            textTheme: ButtonTextTheme.normal,
          ), */
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsTheme.bgTela),
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
