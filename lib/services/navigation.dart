import 'package:flutter/cupertino.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<T?> push<T extends Object?>(Route<T> route) async {
    return await navigatorKey.currentState?.push(route);
  }

  void pop<T extends Object?>([T? results]) {
    return navigatorKey.currentState?.pop();
  }
}
