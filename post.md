---
author: Elte
layout: post
title: "Understanding the Flutter Router API / Navigator 2.0 step by step"
date: 2022-09-04 08:00:00 +0200
background: '/images/cover.jpg'
---
I'm not going to waste too much time on an intro: you're here because you're
trying to use the Flutter Router API, and the documentation is full of
boilerplate and hard to understand. I agree. I also think it's not fundamentally
all that complicated, so I'm going to try to explain it, by introducing the
parts one at a time. I'm also going to avoid explaining anything that isn't
relevant. Maybe it's a fool's errand - I guess we'll find out!

This post assumes you understand how to build
a basic app in Flutter without the Router magic. Plenty of excellent resources
on that are but one Google search away.

# Step 1: An app from state
Fundamentally, a Flutter app is a function that turns a state into a set of
on screen widgets. For this guide, I'll be creating an app with three screens:

- A `WelcomeScreen`
- A `PostsScreen`, showing a list of posts
- A `PostDetailsScreen` showing details of a post.

I'm not going to implement the screens beyond the absolutely necessary or even display their
code here, because it's not relevant here. The final code for this guide will be available
[in this repository](https://github.com/ElteHupkes/flutter-router-step-by-step). Let's define
our app state:

```dart
class AppState {
  /// Show the list of posts if this value is true
  final bool showPosts;
  
  /// Show a specific post if this value is true
  final int? postId;

  const AppState({
    this.showPosts = false,
    this.postId,
  });
}
```

I believe this state speaks for itself. Let's use the state to build our app:

```dart
class RouterGuide extends StatefulWidget {
  const RouterGuide({super.key});

  @override
  State<RouterGuide> createState() => _RouterGuideState();
}

class _RouterGuideState extends State<RouterGuide> {
  AppState appState = const AppState();

  /// App state updater
  void changeAppState(AppState state) => setState(() => appState = state);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget home;
    if (appState.postId != null) {
      final post = posts.firstWhere((element) => element.id == appState.postId);
      home = PostDetailsScreen(post: post);
    } else if (appState.showPosts) {
      home = const PostsScreen();
    } else {
      home = const WelcomeScreen();
    }

    return MaterialApp(
      title: 'Flutter Router Step By Step',
      home: home,
    );
  }
}
```