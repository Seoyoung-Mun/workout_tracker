import 'dart:convert';
import 'package:http/http.dart';
import 'package:workout_tracker/models/workoutArticle.dart';

class ArticleApiService {
  Future<List<WorkoutArticle>> getArticleData() async {
    String requestUrl =
        'https://public-api.wordpress.com/rest/v1.1/read/tags/workout/posts';
    try {
      Response response = await get(Uri.parse(requestUrl));
      // print(response.body);
      // print(response.bodyBytes); //언어가 다른 데이터를 받아올때 안전하게 받아오는 인코딩메서드
      // print(response.statusCode);
      // print(response.headers);
      final decodedDataString = utf8.decode(response.bodyBytes);
      // print(decodedData); //utf8로 디코딩 한 데이터
      //print는 짧은 데이터만 출력할 수 있어서 log를 사용하면 더 긴 데이터를 출력할 수 있음
      // log(decodedDataString);
      final decodedData = jsonDecode(decodedDataString); //map타입으로 바꿈

      // 필요한 데이터만 가져오기
      final posts = decodedData['posts'];

      List<WorkoutArticle> articles = [];

      for (var post in posts) {
        articles.add(WorkoutArticle.fromMap(post));
      }
      return articles;
    } catch (e) {
      throw Exception('api data error: ${e}');
    }
  }
}
