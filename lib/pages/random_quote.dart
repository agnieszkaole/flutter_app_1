import 'package:flutter/material.dart';

class RandomQuote extends StatelessWidget {
  final String content;
  final String author;
  final int id;

  const RandomQuote({
    super.key,
    required this.content,
    required this.author,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            author,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
