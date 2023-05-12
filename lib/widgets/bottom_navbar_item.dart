import 'package:crossover_test/pallette.dart' as palette;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@override
BottomNavigationBarItem buildBottomNavbarItem(
    {required String label, required String icon, required bool active}) {
  return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SvgPicture.asset(
          "assets/icons/$icon.svg",
          width: 22,
          colorFilter: ColorFilter.mode(
              active ? palette.white : palette.fadedWhite, BlendMode.srcIn),
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SvgPicture.asset(
          "assets/icons/$icon.svg",
          width: 22,
        ),
      ),
      label: label);
}
