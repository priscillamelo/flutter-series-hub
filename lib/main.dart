import 'package:flutter/material.dart';
// PAGES
import 'pages/add_movie_serie_page.dart';
import 'pages/criar_conta_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'routes_pages.dart';
// WIDGETS
import 'package:flutter_journal_moviesandseries/widgets/colors.dart';
// FIREBASE
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
        /* buttonTheme: const ButtonThemeData(
            buttonColor: ColorsTheme.bgInputDetails,
            textTheme: ButtonTextTheme.normal,
          ), */
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsTheme.bgTela),
        useMaterial3: true,
      ),
      routes: {
        "/login": (context) => const LoginPage(),
        "/criarConta": (context) => const CriarContaPage(),
        "/home": (context) => const HomePage(),
        "/addMovieOrSerie": (context) => const AddMovieOrSeriePage()
      },
      home: const DefaultTabController(
        length: 3,
        child: Routes(),
      ),
    );
  }
}
