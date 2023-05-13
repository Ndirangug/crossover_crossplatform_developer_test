import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAvatar extends StatelessWidget {
  final double width;
  const UserAvatar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        "assets/icons/avatar.svg",
        width: width,
      ),
    );
  }
}
