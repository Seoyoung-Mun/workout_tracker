import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    onTap: (){
                      launchUrl(Uri.parse(article.postURL));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //왼쪽 정렬
                      children: [
                        ClipRRect(
                          //이미지를 둥글게 만들기 위해 사용
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.network(
                            article.thumbnailURL,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Image.asset(
                                'assets/me.jpg',
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(article.avatarURL),
                              radius: 18,
                              // onBackgroundImageError: (_, __) {
                              //   return Image.asset(
                              //     'assets/me.jpg',
                              //     fit: BoxFit.cover,
                              //   );
                              //   },
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text(
                              article.authorName,
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                              //text가 길어도 ...으로 생략
                              maxLines: 1, //한줄로 표시
                            )),
                            Text(
                              '${article.postDate.year}-${article.postDate.month.toString().padLeft(2, '0')}-${article.postDate.day.toString().padLeft(2, '0')} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          article.postTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          article.postExcerpt,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 10),
                        Wrap(
                            spacing: 5.0,
                            runSpacing: -8.0,
                            // children: [
                            //   Chip(label: Text('article.postTag'),backgroundColor: Colors.grey[300],),
                            // ],
                            children: article.postTag
                                .take(3)
                                .map((tag) => Chip(
                                      label: Text(
                                        tag,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.secondary,
                                    ))
                                .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
