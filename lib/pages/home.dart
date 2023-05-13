import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/home_top_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).extension<Pallette>()!.primaryGradientColor1,
            Theme.of(context).extension<Pallette>()!.primaryGradientColor2
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.03),
                width: constraints.maxWidth,
                height: constraints.maxWidth * 0.12,
                child: const HomeTopBar(),
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
