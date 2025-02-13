import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/logic/provider/article_provider.dart';
import 'package:workout_tracker/models/workoutArticle.dart';

class WorkoutArticleListPage extends StatefulWidget {
  const WorkoutArticleListPage({super.key});

  @override
  State<WorkoutArticleListPage> createState() => _WorkoutArticleListPageState();
}

class _WorkoutArticleListPageState extends State<WorkoutArticleListPage> {
  WorkoutArticle? workoutArticle; //instance variable

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //page가 열리면 getArticles 메소드를 호출
    Provider.of<ArticleProvider>(context, listen: false)
        .getArticles(); //메서드 호출시엔 listen: false
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Article'),
        ),
        body: Consumer<ArticleProvider>(
          builder: (context, articleProvider, child) {
            final articles = articleProvider.articles;
            if (articles.isEmpty) {
              return Center(
                child: CircularProgressIndicator(), //로딩중일때 표시
              );
            }
            return Center(
              child: Text('articles: ${articles.length}'),
            );
          },
        )
    );
  }
}
