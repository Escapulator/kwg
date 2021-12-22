import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwgg/Screens/home.dart';
import 'package:kwgg/Screens/kwg_website.dart';
import 'package:kwgg/Screens/splash.dart';
import 'package:kwgg/Screens/view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KWG',
      home: const Splash(),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName: (BuildContext context) => const Home(),
        View.routeName: (BuildContext context) => const View(),
        KwgWebsite.routeName: (BuildContext context) => const KwgWebsite(),
      },
    );
  }
}
