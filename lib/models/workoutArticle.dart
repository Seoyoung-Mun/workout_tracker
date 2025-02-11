class WorkoutArticle {
  String postTitle;
  String authorName;
  String avatarURL;
  String postURL;
  String postExcerpt;
  int likeCount;
  int commentCount;
  String thumbnailURL;
  DateTime postDate;
  List<String> postTag;

  WorkoutArticle({
    required this.postTitle,
    required this.authorName,
    required this.avatarURL,
    required this.postURL,
    required this.postExcerpt,
    required this.likeCount,
    required this.commentCount,
    required this.thumbnailURL,
    required this.postDate,
    required this.postTag,
  });

}
