import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedActions extends StatelessWidget {
  final List<Widget> items;
  final double spacing;
  const FeedActions({super.key, required this.items, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: items
          .map((item) => Container(
                margin: EdgeInsets.only(top: spacing),
                child: item,
              ))
          .toList(),
    );
  }
}

class ActionItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback? onTap;
  final Color? color;
  const ActionItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              "assets/icons/$icon.svg",
              width: 30,
              colorFilter: ColorFilter.mode(
                  color ?? Theme.of(context).extension<Pallette>()!.normalText,
                  BlendMode.srcIn),
            ),
          ),
          Text(
            label,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
