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

  factory WorkoutArticle.fromMap(Map<String, dynamic> post) {
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

    final workoutArticle = WorkoutArticle(
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
    return workoutArticle;
  }
}
