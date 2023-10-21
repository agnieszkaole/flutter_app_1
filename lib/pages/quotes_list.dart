import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/global_variables.dart';
import 'package:flutter_app_1/widgets/single_quote.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_app_1/providers/unsplash_provider.dart';
import 'package:http/http.dart' as http;

class QuotesList extends StatefulWidget {
  const QuotesList({
    super.key,
  });

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  List data = [];
  List<String> imgUrl = [];

  Future<String> getData() async {
    final response = await http.get(
      Uri.parse(
          'https://api.unsplash.com/photos/?client_id=nEnXsjwu13IEN7n11IApWxSa0VWcyroqFUHJlF1cPFY'),
    );

    data = json.decode(response.body);
    for (var i = 0; i < data.length; i++) {
      imgUrl.add(data.elementAt(i)["urls"]["regular"]);
    }

    return imgUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: FutureBuilder<String>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    final quote = quotes[index];
                    return SingleQuote(
                      content: quote['content'] as String,
                      author: quote['author'] as String,
                      id: quote['id'] as int,
                      imgUrl: imgUrl,
                    );
                  });
            } else if (snapshot.hasError) {
              return const Text("BŁĄD");
            } else {
              return const SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
