import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workoutArticle.dart';
import 'package:workout_tracker/services/article_api_service.dart';

class ArticleProvider extends ChangeNotifier {
  ArticleApiService articleApiService = ArticleApiService(); //객체호출
  List<WorkoutArticle> _articles = []; //외부에서 접근을 막기위해 private
  //List<WorkoutArticle> get articles => _articles; //private을 접근하기위해 getter
  List<WorkoutArticle> get articles => UnmodifiableListView(_articles); //변경불가능한 리스트로 변환

  Future<void> getArticles() async {
    _articles = await articleApiService.getArticleData();
    notifyListeners(); //변경된 데이터를 사용하는 위젯들에게 알려줌
  }
}
