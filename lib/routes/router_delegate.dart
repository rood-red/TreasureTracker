import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasure_tracker/routes/app_pages.dart';

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(AppRoutes.intro)!.currentPage!],
    );
  }
}
