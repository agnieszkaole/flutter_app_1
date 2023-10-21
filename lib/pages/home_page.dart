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
        // body: const CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       title: Text('Motivea'),
        //       centerTitle: true,
        //     )
        //   ],
        // ),
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: const Color.fromRGBO(55, 48, 107, 1),
        //   title: const Text(
        //     'Motivea',
        //     style: TextStyle(
        //       fontSize: 30,
        //       // color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   centerTitle: true,
        //   toolbarHeight: 80,
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
              label: 'Cytat na dzisiaj',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.format_quote_rounded,
              ),
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
