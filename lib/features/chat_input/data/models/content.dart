class Content {
  final String? articleContent;
  final String? linkedInContent;
  final String? twitterContent;

  Content({this.articleContent, this.linkedInContent, this.twitterContent});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      articleContent: json['Artical_content'],
      linkedInContent: json['LinkedIn_content'],
      twitterContent: json['Twitter'],
    );
  }
}
