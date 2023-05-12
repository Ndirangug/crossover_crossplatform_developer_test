import 'package:crossover_test/pages/activity.dart';
import 'package:crossover_test/pages/bookmarks.dart';
import 'package:crossover_test/pages/discover.dart';
import 'package:crossover_test/pages/home.dart';
import 'package:crossover_test/pages/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum Routes {
  home,
  discover,
  activity,
  bookmarks,
  profile;

  String get route {
    return '/${describeEnum(this)}';
  }

  Widget get widget {
    switch (this) {
      case Routes.home:
        return const HomePage();
      case Routes.discover:
        return const DiscoverPage();
      case Routes.activity:
        return const ActivityPage();
      case Routes.bookmarks:
        return const BookmarksPage();
      case Routes.profile:
        return const ProfilePage();
    }
  }

  static GetPageRoute getPage(RouteSettings settings) {
    var destination =
        Routes.values.firstWhereOrNull((e) => e.route == settings.name);
    return GetPageRoute(page: () => destination?.widget ?? Container());
  }
}
