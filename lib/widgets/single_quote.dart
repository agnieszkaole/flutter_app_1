import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_app_1/providers/favorite_provider.dart';
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
      height: 350,
      margin: const EdgeInsets.all(15),
      child: Card(
        // color: const Color.fromRGBO(0, 0, 0, 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.3),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(imgUrl[randomIndex]
                      // "https://images.unsplash.com/photo-1697069154476-2ded6a530348?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MTQyNDZ8MHwxfGFsbHw5fHx8fHx8Mnx8MTY5NzYzOTcyOXw&ixlib=rb-4.0.3&q=80&w=1080",
                      ),
                  // ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // color: const Color.fromRGBO(0, 0, 0, 0.2),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Text(
                        content,
                        style: const TextStyle(
                          fontSize: 22,
                          height: 1.1,
                          // shadows: [
                          //   Shadow(
                          //     color: Color.fromARGB(255, 31, 31, 31),
                          //     blurRadius: 3.0,
                          //     offset: Offset(1.0, 1.0),
                          //   ),
                          // ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        author,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              iconSize: 30,
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
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              iconSize: 30,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
