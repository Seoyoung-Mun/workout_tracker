import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorkoutArticleListPage extends StatefulWidget {
  const WorkoutArticleListPage({super.key});

  @override
  State<WorkoutArticleListPage> createState() => _WorkoutArticleListPageState();
}

class _WorkoutArticleListPageState extends State<WorkoutArticleListPage> {
  Future<void> getArticleData() async {
    String requestUrl =
        'https://public-api.wordpress.com/rest/v1.1/read/tags/workout/posts';
    Response response = await get(Uri.parse(requestUrl));
    // print(response.body);
    // print(response.bodyBytes); //언어가 다른 데이터를 받아올때 안전하게 받아오는 인코딩메서드
    final decodedData = utf8.decode(response.bodyBytes);
    // print(decodedData); //utf8로 디코딩 한 데이터
    //print는 짧은 데이터만 출력할 수 있어서 log를 사용하면 더 긴 데이터를 출력할 수 있음
    // log(decodedData);
    // print(response.statusCode);
    // print(response.headers);

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
          child: Text('ariticle body'),
        ));
  }
}
