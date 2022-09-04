import 'package:flutter/material.dart';
import 'package:router_step_by_step/app_state.dart';

import 'posts.dart';

/// Shows a list of posts
class PostsScreen extends StatelessWidget {
  final StateUpdater update;

  const PostsScreen({
    Key? key,
    required this.update,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: ListView.builder(
        itemBuilder: (context, idx) => idx == posts.length
            ? ListTile(
                title: const Text("Go back"),
                leading: const Icon(Icons.arrow_back),
                onTap: () => update(const AppState()),
              )
            : ListTile(
                title: Text(posts[idx].title),
                onTap: () => update(AppState(postId: posts[idx].id)),
              ),
        itemCount: posts.length + 1,
      ),
    );
  }
}

/// Shows the details of a post
class PostDetailsScreen extends StatelessWidget {
  final StateUpdater update;

  /// The post to display in this screen
  final Post post;

  const PostDetailsScreen({
    super.key,
    required this.post,
    required this.update,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(post.body),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => update(const AppState(showPosts: true)),
              child: const Text("Back to overview"),
            )
          ],
        ),
      ),
    );
  }
}
