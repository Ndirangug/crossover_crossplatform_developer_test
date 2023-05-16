import 'package:crossover_test/models/mcq.dart';
import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/mcq/answer_tile.dart';
import 'package:flutter/material.dart';

class MCQWidget extends StatelessWidget {
  final MCQ mcq;
  const MCQWidget({super.key, required this.mcq});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          mcq.question,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 21,
                                  color: Theme.of(context)
                                      .extension<Pallette>()!
                                      .normalText),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: mcq.options
                            .map((option) => AnswerTile(
                                  option: option,
                                  questionId: mcq.id,
                                  width: constraints.maxWidth,
                                  height: 52,
                                  margin: const EdgeInsets.only(bottom: 10),
                                ))
                            .toList()),
                  )
                ],
              ),
            ));
  }
}
