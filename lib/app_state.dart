import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final bool showPosts;
  final int? postId;

  const AppState({
    this.showPosts = false,
    this.postId,
  });
}

typedef StateUpdater = void Function(AppState newState);
