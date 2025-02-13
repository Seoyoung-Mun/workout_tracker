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
    String requestUrl =
        'https://public-api.wordpress.com/rest/v1.1/read/tags/workout/posts';
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
    final post = decodedData['posts'][0];

    print(post['title'].toString());
    print(post['author']['name'].toString());
    print(post['author']['avatar_URL'].toString());
    print(DateTime.parse(post['date']));
    print(post['URL'].toString());
    print(post['excerpt'].toString());
    print(post['like_count'].toString());
    print(post['comment_count'].toString());
    print(post['tags'].toString());
    print('${post['featured_image'].toString()}');

    String postTitle = post['title'] ?? 'No title';
    String authorName = post['author']['name'] ?? 'No author';
    String avatarURL = post['author']['avatar_URL'] ?? 'No author avatar URL';
    String postURL = post['URL'] ?? 'No URL';
    String postExcerpt = post['excerpt'] ?? 'No excerpt';
    int likeCount = post['like_count'] ?? 0;
    int commentCount = post['comment_count'] ?? 0;
    String thumbnailURL = post['featured_image'] ?? 'No featured image';
    DateTime postDate = DateTime.parse(post['date']);
    List<String> postTag = (post['tags'] as Map<String, dynamic>)
        .values
        .map((tag) => tag['name'] as String)
        .toList();

    workoutArticle = WorkoutArticle(
      postTitle: postTitle,
      authorName: authorName,
      avatarURL: avatarURL,
      postURL: postURL,
      postExcerpt: postExcerpt,
      likeCount: likeCount,
      commentCount: commentCount,
      thumbnailURL: thumbnailURL,
      postDate: postDate,
      postTag: postTag,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticleData().then((_) { //then은 getArticleData가 끝나면 실행해주는 함수
      setState(() {}); //setState는 다시 실행해주는 함수
    });
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
