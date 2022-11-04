import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/newsModel.dart';

class homeProvider extends ChangeNotifier {
  int selectIndex = 0;

  Articles? datapicker;

  String country = "in";

  void ChangeCountry(String c1) {
    country = c1;
    notifyListeners();
  }

  Future<NewsModel> newsapi(String data) async {
    String apilink =
        "https://newsapi.org/v2/everything?q=$data&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=publishedAt&apiKey=3e71a8393c9e443dbd81f1c85ff621e6";

    var jsonString = await http.get(Uri.parse(apilink));
    var json = jsonDecode(jsonString.body);

    return NewsModel.fromJson(json);
  }

  void selectindex(int i) {
    selectIndex = i;
    notifyListeners();
  }
}
