import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    //apikey1 =   97a7d4d8225e42c78d17a087b1c3181b
    //apikey2 =   f1045f85212d435a855a70e99532b81b
    const String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=97a7d4d8225e42c78d17a087b1c3181b";

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
        "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=97a7d4d8225e42c78d17a087b1c3181b";

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
