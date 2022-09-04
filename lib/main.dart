import 'package:flutter/material.dart';
import 'package:router_step_by_step/app_state.dart';
import 'package:router_step_by_step/posts/posts.dart';
import 'package:router_step_by_step/posts/screens.dart';
import 'package:router_step_by_step/router/delegate.dart';
import 'package:router_step_by_step/router/parser.dart';
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
  final delegate = AppRouterDelegate();
  final parser = RouteParser();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      backButtonDispatcher: RootBackButtonDispatcher(),
      routeInformationParser: parser,
      routerDelegate: delegate,
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: const RouteInformation(location: "/"),
      ),
    );
  }
}
