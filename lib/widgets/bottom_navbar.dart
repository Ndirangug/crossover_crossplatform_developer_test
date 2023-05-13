import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/router.dart';
import 'package:crossover_test/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatefulWidget {
  final int navigatorKey;
  const BottomNavbar({required this.navigatorKey, super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 10,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Theme.of(context).extension<Pallette>()!.primary,
      selectedLabelStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.w500),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.w500),
      unselectedItemColor:
          Theme.of(context).extension<Pallette>()!.disabledText,
      selectedItemColor: Theme.of(context).extension<Pallette>()!.normalText,
      items: [
        buildBottomNavbarItem(
            label: "Home", icon: "home", active: _currentIndex == 0),
        buildBottomNavbarItem(
            label: "Discover", icon: "discover", active: _currentIndex == 1),
        buildBottomNavbarItem(
            label: "Activity", icon: "activity", active: _currentIndex == 2),
        buildBottomNavbarItem(
            label: "Bookmarks", icon: "bookmarks", active: _currentIndex == 3),
        buildBottomNavbarItem(
            label: "Profile", icon: "profile", active: _currentIndex == 4),
      ],
      onTap: (index) {
        if (index == _currentIndex) return;

        setState(() {
          _currentIndex = index;
        });

        switch (index) {
          case 0:
            Get.toNamed(Routes.home.route, id: widget.navigatorKey);
            break;
          case 1:
            Get.toNamed(Routes.discover.route, id: widget.navigatorKey);
            break;
          case 2:
            Get.toNamed(Routes.activity.route, id: widget.navigatorKey);
            break;
          case 3:
            Get.toNamed(Routes.bookmarks.route, id: widget.navigatorKey);
            break;
          case 4:
            Get.toNamed(Routes.profile.route, id: widget.navigatorKey);
            break;
        }
      },
    );
  }
}
