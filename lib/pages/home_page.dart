import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/favorite_page.dart';
// import 'package:flutter_app_1/pages/quote_of_the_day_test.dart';
import 'package:flutter_app_1/pages/quote_of_the_day_page.dart';
import 'package:flutter_app_1/pages/quotes_list_page.dart';

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
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // label: 'Home',
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.format_quote_rounded,
              ),
              // label: 'Lista cytatów',
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              // label: 'Ulubione',
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
