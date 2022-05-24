import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    const String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=f1045f85212d435a855a70e99532b81b";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element["author"] ?? "",
            title: element["title"] ?? "",
            description: element["description"] ?? "",
            url: element["url"] ?? "",
            urlToImage: element["urlToImage"] ?? "",
            content: element["content"] ?? "",
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=f1045f85212d435a855a70e99532b81b";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element["author"] ?? "",
            title: element["title"] ?? "",
            description: element["description"] ?? "",
            url: element["url"] ?? "",
            urlToImage: element["urlToImage"] ?? "",
            content: element["content"] ?? "",
          );
          news.add(articleModel);
        }
      });
    }
  }
}
