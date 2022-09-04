import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:router_step_by_step/app_state.dart';

import '../posts/posts.dart';
import '../posts/screens.dart';
import '../welcome_screen.dart';

class AppRouterDelegate extends RouterDelegate<AppState> with ChangeNotifier {
  var _state = const AppState();

  @override
  AppState? get currentConfiguration => _state;

  void changeAppState(AppState state) {
    _state = state;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: _onPopPage,
      pages: [
        // The welcome screen is always there, at the bottom of the stack
        MaterialPage(
          child: WelcomeScreen(
            update: changeAppState,
          ),
          name: "welcome",
        ),

        // Display the post list if a post is showing, or if we
        // requested the post list.
        if (_state.showPosts || _state.postId != null)
          MaterialPage(
            child: PostsScreen(
              update: changeAppState,
            ),
            name: "posts",
          ),

        // Finally a Post if the state says so
        if (_state.postId != null)
          MaterialPage(
            child: PostDetailsScreen(
              update: changeAppState,
              post: posts.firstWhere((element) => element.id == _state.postId),
            ),
            name: "post_details",
          ),
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(AppState configuration) {
    changeAppState(configuration);
    return Future.value(null);
  }

  /// Called when the navigator pops a page
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    final name = route.settings.name;
    if (name == "post_details") {
      changeAppState(const AppState(showPosts: true));
    } else if (name == "posts") {
      changeAppState(const AppState());
    }

    return true;
  }

  @override
  Future<bool> popRoute() {
    return Future.value(false);
  }
}
