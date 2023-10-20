import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/providers/favorite_provider.dart';
// import 'package:flutter_app_1/providers/unsplash_provider.dart';
import 'pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        // ChangeNotifierProvider(create: (context) => UnsplashProvider()),
      ],
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: MaterialApp(
            scrollBehavior: AppScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'Projekt 1',
            theme: ThemeData(
              useMaterial3: true,
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    bodyColor: const Color.fromARGB(255, 255, 255, 255),
                    displayColor: const Color.fromARGB(255, 92, 36, 182),
                  ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blueAccent,
              ),
            ),
            home: const HomePage(),
          ),
        ),
        // ),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}