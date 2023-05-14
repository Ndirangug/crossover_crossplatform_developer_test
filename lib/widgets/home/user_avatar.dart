import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double width;
  final String avatarUrl;
  const UserAvatar({super.key, required this.width, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: width,
        height: width,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Theme.of(context).extension<Pallette>()!.normalText,
                width: 2)),
        child: Image.network(avatarUrl, fit: BoxFit.cover),
      ),
    );
  }
}
