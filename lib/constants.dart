import 'package:flutter/material.dart';

AppBar appBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Color(
      (0xff00509d),
    ),
    title: Text(title),
  );
}

const generalColor = Color(0xff00509d);

class NewsList {
  List<News> news;

  NewsList({this.news});

  factory NewsList.fromjson(List<dynamic> parsedjson) {
    List<News> news = List<News>();
    news = parsedjson.map((e)=>News.fromjson(e)).toList();
  }
}

class News {
  String title;
  int id;
  String body;
  News({this.title, this.id, this.body});

  factory News.fromjson(Map<String, dynamic> json) {
    return News(title: json['title'], id: json['id'], body: json['body']);
  }
}
