// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
    this.title,
    this.permalink,
    this.image,
    this.authorName,
    this.excerpt,
    this.content,
    this.date,
  });

  String title;
  String permalink;
  String image;
  String authorName;
  String excerpt;
  String content;
  String date;

  factory News.fromJson(Map<String, dynamic> json) => News(
        title: json["title"],
        permalink: json["permalink"],
        image: json["image"],
        authorName: json["authorName"],
        excerpt: json["excerpt"],
        content: json["content"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "permalink": permalink,
        "image": image,
        "authorName": authorName,
        "excerpt": excerpt,
        "content": content,
        "date": date,
      };
}
