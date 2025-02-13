import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:workout_tracker/models/workoutArticle.dart';

class WorkoutArticleListPage extends StatefulWidget {
  const WorkoutArticleListPage({super.key});

  @override
  State<WorkoutArticleListPage> createState() => _WorkoutArticleListPageState();
}

class _WorkoutArticleListPageState extends State<WorkoutArticleListPage> {
  WorkoutArticle? workoutArticle; //instance variable
  Future<void> getArticleData() async {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Article'),
        ),
        body: Center(
          child: Text('${workoutArticle?.postTitle}'),
        ));
  }
}
