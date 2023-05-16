import 'package:crossover_test/controllers/for_you_controller.dart';
import 'package:crossover_test/models/mcqoption.dart';
import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AnswerTile extends StatelessWidget {
  final int questionId;
  final McqOption option;
  final ForYouController _forYouController = Get.find();
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  AnswerTile(
      {super.key,
      this.margin = EdgeInsets.zero,
      required this.option,
      required this.questionId,
      this.width,
      this.height});

  //var _hasTrailingIcon = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var questionState = _forYouController.mcqsState[questionId]!;
      var answerState = _forYouController.getAnswerState(
          questionId: questionId, givenAnswerId: option.id);

      return GestureDetector(
        onTap: () {
          if (!questionState.isFlipped) {
            _forYouController.supplyAnswer(
                questionId: questionId, answerId: option.id);
            _forYouController.toggleFlipCard(questionId);
          }
        },
        child: Container(
          width: width,
          height: height,
          margin: margin,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: _getAnswerColor(
                  context: context,
                  answerState: answerState,
                  isFlipped: questionState.isFlipped),
              borderRadius: BorderRadius.circular(8)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(option.answer,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17,
                        )),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Obx(() => Container(
                    //color: Colors.black.withOpacity(0.2),
                    width: 28,
                    height: 27,
                    child: _forYouController.answerLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: Theme.of(context)
                                  .extension<Pallette>()!
                                  .normalText
                                  .withOpacity(0.6),
                            ),
                          )
                        : _getTrailingIcon(
                            context: context,
                            answerState: answerState,
                            isFlipped: questionState.isFlipped),
                  )),
            )
          ]),
        ),
      );
    });
  }

  Widget _getTrailingIcon(
      {required BuildContext context,
      required AnswerState answerState,
      required bool isFlipped}) {
    // Widget trailing = Container();
    if (!isFlipped) return Container();

    switch (answerState) {
      case AnswerState.correct:
        return SvgPicture.asset("assets/icons/correct.svg");
      case AnswerState.wrong:
        return SvgPicture.asset("assets/icons/wrong.svg");
      case AnswerState.unmarked:
        return Container();
    }
  }

  Color _getAnswerColor(
      {required BuildContext context,
      required AnswerState answerState,
      required bool isFlipped}) {
    if (!isFlipped) {
      return Theme.of(context)
          .extension<Pallette>()!
          .normalText
          .withOpacity(0.2);
    }

    switch (answerState) {
      case AnswerState.correct:
        return Theme.of(context).extension<Pallette>()!.tertiary5;
      case AnswerState.wrong:
        return Theme.of(context).extension<Pallette>()!.error;
      case AnswerState.unmarked:
        return Theme.of(context)
            .extension<Pallette>()!
            .normalText
            .withOpacity(0.2);
    }
  }
}
