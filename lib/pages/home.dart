import 'package:crossover_test/controllers/following_controller.dart';
import 'package:crossover_test/controllers/for_you_controller.dart';
import 'package:crossover_test/controllers/home_page_controller.dart';
import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/home_top_bar.dart';
import 'package:crossover_test/widgets/home/swipable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final FollowingController _followingController = Get.find();
  final ForYouController _forYouController = Get.find();
  final Logger _logger = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    controller: Get.find<HomePageController>().tabController,
                    children: [
                      Obx(() => PageView(
                          restorationId: "1",
                          scrollDirection: Axis.vertical,
                          controller:
                              _followingController.followingPageController,
                          children:
                              _followingController.flashCards.map((flashCard) {
                            // _logger.i(flashCard);
                            return Swippable(flashCard: flashCard);
                          }).toList())),
                      Obx(() => PageView(
                          restorationId: "2",
                          scrollDirection: Axis.vertical,
                          controller: _forYouController.forYouPageController,
                          children: _forYouController.mcqs.map((mcq) {
                            //_logger.i(mcq);
                            return Swippable(mcq: mcq);
                          }).toList()))
                    ]),
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
