import 'package:crossover_test/controllers/following_controller.dart';
import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerConfidenceTile extends StatelessWidget {
  final int id;
  final int score;
  final FollowingController _followingController = Get.find();

  AnswerConfidenceTile({super.key, required this.id, required this.score});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _followingController.setAnswerConfidence(id: id, confidence: score);
      },
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          margin: const EdgeInsets.only(right: 8),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: getColor(context), borderRadius: BorderRadius.circular(8)),
          child: Text(
            score.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Color getColor(BuildContext context) {
    Color color = Colors.white;

    switch (score) {
      case 1:
        color = Theme.of(context).extension<Pallette>()!.tertiary1;
        break;
      case 2:
        color = Theme.of(context).extension<Pallette>()!.tertiary2;
        break;
      case 3:
        color = Theme.of(context).extension<Pallette>()!.tertiary3;
        break;
      case 4:
        color = Theme.of(context).extension<Pallette>()!.tertiary4;
        break;
      case 5:
        color = Theme.of(context).extension<Pallette>()!.tertiary5;
        break;
    }

    return color;
  }
}
