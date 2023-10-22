import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/providers/favorite_provider.dart';
// import 'package:flutter_app_1/widgets/single_quote.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteQuotes = context.watch<FavoriteProvider>().favoriteQuotes;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ulubione cytaty',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: favoriteQuotes.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'Nie dodałeś jeszcze żadnego cytatu',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteQuotes.length,
              itemBuilder: (context, index) {
                final favoriteItem = favoriteQuotes[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    minVerticalPadding: 15,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        favoriteItem['content'],
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.1,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      favoriteItem['author'],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              final copyQuote =
                                  '${favoriteItem['content'].toString()} ${favoriteItem['author'].toString()}';
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
                            icon: const Icon(
                              Icons.copy,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Ostrzeżenie',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    content: const Text(
                                      'Czy napewno chcesz usunąć ten cytat?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Nie',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<FavoriteProvider>()
                                              .removeQuote(favoriteItem);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Tak',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
