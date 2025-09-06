class Post {
  final String username;
  final String userAvatarUrl;
  final String postUrl;
  final String caption;
  final int likes;

  Post({
    required this.username,
    required this.userAvatarUrl,
    required this.postUrl,
    required this.caption,
    required this.likes,
  });
}
