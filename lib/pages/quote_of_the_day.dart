import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/random_quote.dart';
import 'package:flutter_app_1/global_variables.dart';
import 'dart:math';

class QuoteOfTheDay extends StatelessWidget {
  const QuoteOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    final randomIndex = Random().nextInt(quotes.length);
    final quote = quotes[randomIndex];
    return Container(
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     Color.fromRGBO(54, 116, 214, 1),
        //     Color.fromRGBO(30, 60, 114, 1),
        //   ],
        //   stops: [0.2, 0.9],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        image: DecorationImage(
            image: AssetImage(
              // ('assets/images/estefania-cortes-uzDs1Jr_mOM-unsplash.jpg'),
              ('assets/images/freezydreamin-0Bj1foVFTdU-unsplash.jpg'),
            ),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                // color: const Color.fromARGB(255, 65, 65, 65),
                child: RandomQuote(
                  content: quote['content'] as String,
                  author: quote['author'] as String,
                  id: quote['id'] as int,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
