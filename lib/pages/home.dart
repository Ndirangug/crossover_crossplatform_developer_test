import 'package:crossover_test/controllers/feed_actions_controller.dart';
import 'package:crossover_test/controllers/following_controller.dart';
import 'package:crossover_test/controllers/for_you_controller.dart';
import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/home_top_bar.dart';
import 'package:crossover_test/widgets/home/swipable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final FollowingController _followingController = Get.find();
  final ForYouController _forYouController = Get.find();
  final Logger _logger = Get.find();

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
            Expanded(
                child: LayoutBuilder(
              builder: (context, constraints) => Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: TabBarView(
                    controller: Get.find<FeedActionsController>().tabController,
                    children: [
                      Obx(() => PageView(
                          scrollDirection: Axis.vertical,
                          controller:
                              _followingController.followingPageController,
                          children: _followingController.flashCards.map((e) {
                            _logger.i(e);
                            return Swippable();
                          }).toList())),
                      Obx(() => PageView(
                          scrollDirection: Axis.vertical,
                          controller: _forYouController.forYouPageController,
                          children: _forYouController.mcqs.map((e) {
                            _logger.i(e);
                            return Swippable();
                          }).toList()))
                    ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
