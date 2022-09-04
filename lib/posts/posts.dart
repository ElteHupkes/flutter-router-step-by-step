class Post {
  final int id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });
}

const posts = [
  Post(
    id: 1,
    title: "First post",
    body: "First post content",
  ),
  Post(
    id: 2,
    title: "Second post",
    body: "Second post content",
  ),
];
