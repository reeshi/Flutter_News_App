import 'dart:convert';

import 'package:flutter_news/models/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=41cd541479d849fe89cb99184884d8aa";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "ok") {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articlemodel = new ArticleModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
            );

            news.add(articlemodel);
          }
        });
      }
    } else {
      throw Exception('Failed to load album');
    }

    // if (jsonData['status'] == "ok") {
    //   jsonData['articles'].forEach((element) {
    //     if (element['urlToImage'] != null && element['description'] != null) {
    //       ArticleModel articlemodel = new ArticleModel(
    //         title: element['title'],
    //         description: element['description'],
    //         url: element['url'],
    //         urlToImage: element['urlToImage'],
    //       );

    //       news.add(articlemodel);
    //     }
    //   });
    // }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=41cd541479d849fe89cb99184884d8aa";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "ok") {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articlemodel = new ArticleModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
            );

            news.add(articlemodel);
          }
        });
      }
    } else {
      throw Exception('Failed to load album');
    }
  }
}
