import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> favoriteQuotes = [];

  void addQuote(Map<String, dynamic> quote) {
    favoriteQuotes.add(quote);
    notifyListeners();

    final ids = favoriteQuotes.map((e) => e['id']).toSet();
    favoriteQuotes.retainWhere((Map x) {
      return ids.remove(x['id']);
    });
  }

  void removeQuote(Map<String, dynamic> quote) {
    favoriteQuotes.remove(quote);
    notifyListeners();
  }
}
