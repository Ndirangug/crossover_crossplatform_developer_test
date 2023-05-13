import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenTime extends StatefulWidget {
  const ScreenTime({super.key});

  @override
  State<ScreenTime> createState() => _ScreenTimeState();
}

class _ScreenTimeState extends State<ScreenTime> {
  @override
  Widget build(BuildContext context) {
    var color =
        Theme.of(context).extension<Pallette>()!.normalText.withOpacity(0.6);

    return LayoutBuilder(
        builder: (context, constraints) => Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: constraints.maxWidth * 0.1),
                    child: SvgPicture.asset(
                      "assets/icons/screen_time.svg",
                      width: 20,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                  Text(
                    "10m",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: color, fontSize: 16),
                  )
                ],
              ),
            ));
  }
}
