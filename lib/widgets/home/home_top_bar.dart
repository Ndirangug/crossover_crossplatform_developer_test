import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/screen_time.dart';
import 'package:crossover_test/widgets/home/tab_bar.dart';
import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: const ScreenTime(),
              )),
          Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: const HomeTabbar(),
              )),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.search,
                      color:
                          Theme.of(context).extension<Pallette>()!.normalText,
                      size: 24,
                      weight: 700,
                      //grade: 700,
                    ),
                    onPressed: () {},
                  )))
        ]);
  }
}
