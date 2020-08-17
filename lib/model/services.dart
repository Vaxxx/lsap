import 'package:http/http.dart' as http;
import 'package:sapientia/model/news.dart';
import 'package:sapientia/utilities/constants.dart';

class Services {
  //get all news
  Future<List<News>> getAllNews() async {
    final response = await http.get(getAllNewsUrl);
    return newsFromJson(response.body);
  }

  //get all political news
  Future<List<News>> getAllPoliticsNews() async {
    final response = await http.get(getAllPoliticsNewsUrl);
    return newsFromJson(response.body);
  }

  //get all business news
  Future<List<News>> getAllBusinessNews() async {
    final response = await http.get(getAllBusinessNewsUrl);
    return newsFromJson(response.body);
  }

  //get all Health news
  Future<List<News>> getAllHealthNews() async {
    final response = await http.get(getAllHealthNewsUrl);
    return newsFromJson(response.body);
  }

  //get all Sports news
  Future<List<News>> getAllSportsNews() async {
    final response = await http.get(getAllSportsNewsUrl);
    return newsFromJson(response.body);
  }

  //get all Entertainment news
  Future<List<News>> getAllEntertainmentNews() async {
    final response = await http.get(getAllEntertainmentNewsUrl);
    return newsFromJson(response.body);
  }

  //get all Africa news
  Future<List<News>> getAllAfricaNews() async {
    final response = await http.get(getAllAfricaNewsUrl);
    return newsFromJson(response.body);
  }

  //get all World news
  Future<List<News>> getAllWorldNews() async {
    final response = await http.get(getAllWorldNewsUrl);
    return newsFromJson(response.body);
  }

  //Listen to radio
  Future<List<News>> listenRadio() async {
    final response = await http.get(listenLiveUrl);
    return newsFromJson(response.body);
  }
}
