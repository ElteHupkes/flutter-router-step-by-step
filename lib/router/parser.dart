import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:router_step_by_step/app_state.dart';

class RouteParser extends RouteInformationParser<AppState> {
  @override
  RouteInformation? restoreRouteInformation(AppState configuration) {
    return RouteInformation(location: configuration.toLocation());
  }

  @override
  Future<AppState> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(
        AppState.fromLocation(routeInformation.location ?? "/"));
  }
}
