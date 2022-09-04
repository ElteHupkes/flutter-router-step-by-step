import 'package:flutter/material.dart';
import 'package:router_step_by_step/app_state.dart';
import 'package:router_step_by_step/posts/posts.dart';
import 'package:router_step_by_step/posts/screens.dart';
import 'package:router_step_by_step/welcome_screen.dart';

void main() {
  runApp(const RouterGuide());
}

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
      home = PostDetailsScreen(
        post: post,
        update: changeAppState,
      );
    } else if (appState.showPosts) {
      home = PostsScreen(update: changeAppState);
    } else {
      home = WelcomeScreen(update: changeAppState);
    }

    return MaterialApp(
      title: 'Flutter Router Step By Step',
      home: home,
    );
  }
}
