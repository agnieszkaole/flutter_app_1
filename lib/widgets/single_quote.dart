import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/providers/favorite_provider.dart';
import 'package:flutter_app_1/widgets/glass.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class SingleQuote extends StatelessWidget {
  final String content;
  final String author;
  final int id;
  final List<String> imgUrl;

  const SingleQuote({
    super.key,
    required this.content,
    required this.author,
    required this.id,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final randomIndex = Random().nextInt(imgUrl.length);
    return Container(
      height: 400,
      margin: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          image: DecorationImage(
            image: NetworkImage(imgUrl[randomIndex]
                // "https://images.unsplash.com/photo-1697069154476-2ded6a530348?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MTQyNDZ8MHwxfGFsbHw5fHx8fHx8Mnx8MTY5NzYzOTcyOXw&ixlib=rb-4.0.3&q=80&w=1080",
                ),
            // ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          GlassMorphism(
            start: 0.9,
            end: 0.6,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          iconSize: 28,
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Provider.of<FavoriteProvider>(context,
                                    listen: false)
                                .addQuote(
                              {
                                'content': content,
                                'author': author,
                                'id': id,
                              },
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Dodano do ulubionych'),
                                  duration: Duration(milliseconds: 200)),
                            );
                          },
                        ),
                        IconButton(
                          iconSize: 28,
                          icon: const Icon(Icons.copy_outlined,
                              color: Colors.white),
                          onPressed: () {
                            final copyQuote = '$content $author ';
                            Clipboard.setData(
                              ClipboardData(
                                text: copyQuote,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Skopiowano'),
                                duration: Duration(milliseconds: 200),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
