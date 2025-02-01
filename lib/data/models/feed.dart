class Feed {
  final int id;
  final String videoUrl;
  final String title;
  final String description;
  final String song;
  final String songUrl;
  final String profileUrl;
  final String like;
  final String comment;
  final String bookmark;
  final String share;

  Feed({
    required this.id,
    required this.videoUrl,
    required this.title,
    required this.description,
    required this.song,
    required this.songUrl,
    required this.profileUrl,
    required this.like,
    required this.comment,
    required this.bookmark,
    required this.share,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['id'],
      videoUrl: json['videoUrl'],
      title: json['title'],
      description: json['description'],
      song: json['song'],
      songUrl: json['songUrl'],
      profileUrl: json['profileUrl'],
      like: json['like'],
      comment: json['comment'],
      bookmark: json['bookmark'],
      share: json['share'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'videoUrl': videoUrl,
      'title': title,
      'description': description,
      'song': song,
      'songUrl': songUrl,
      'profileUrl': profileUrl,
      'like': like,
      'comment': comment,
      'bookmark': bookmark,
      'share': share,
    };
  }
}
