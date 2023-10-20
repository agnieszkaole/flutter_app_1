import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/favorite_page.dart';
// import 'package:flutter_app_1/pages/quote_of_the_day_test.dart';
import 'package:flutter_app_1/pages/quote_of_the_day.dart';
import 'package:flutter_app_1/pages/quotes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    QuoteOfTheDay(),
    QuotesList(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   // elevation: 0,
        //   title: const Text(
        //     'Projekt 1',
        //     style: TextStyle(
        //       fontSize: 30,
        //       // color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),

        //   centerTitle: true,
        // ),
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 18,
          unselectedFontSize: 16,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: 'Cytat dnia',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Cytaty',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Ulubione',
            ),
          ],
        ),
      ),
    );
  }
}
