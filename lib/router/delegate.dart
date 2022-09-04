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
    if (_state.postId != null) {
      final post = posts.firstWhere((element) => element.id == _state.postId);
      return PostDetailsScreen(
        post: post,
        update: changeAppState,
      );
    }

    if (_state.showPosts) {
      return PostsScreen(update: changeAppState);
    }

    return WelcomeScreen(update: changeAppState);
  }

  @override
  Future<void> setNewRoutePath(AppState configuration) {
    changeAppState(configuration);
    return Future.value(null);
  }

  @override
  Future<bool> popRoute() {
    return Future.value(false);
  }
}
