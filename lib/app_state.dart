import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final bool showPosts;
  final int? postId;

  const AppState({
    this.showPosts = false,
    this.postId,
  });

  /// Converts this app state to a URI
  String toLocation() {
    if (postId != null) {
      return "/posts/$postId";
    }

    if (showPosts) {
      return "/posts";
    }

    return "/";
  }

  /// Converts a string location into an [AppState]. This is very sloppy
  /// with incorrect URLs of course, but that's not relevant here.
  static AppState fromLocation(String location) {
    final parts = location.split("/").where((l) => l.isNotEmpty).toList();
    if (parts.isNotEmpty && parts[0] == "posts") {
      final id = parts.length > 1 ? int.tryParse(parts[1]) : null;
      return AppState(postId: id, showPosts: id == null);
    }

    return const AppState();
  }
}

typedef StateUpdater = void Function(AppState newState);
