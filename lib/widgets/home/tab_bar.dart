import 'package:crossover_test/controllers/feed_actions_controller.dart';
import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabbar extends StatefulWidget {
  const HomeTabbar({super.key});

  @override
  State<HomeTabbar> createState() => _HomeTabbarState();
}

class _HomeTabbarState extends State<HomeTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => TabBar(
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                unselectedLabelStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.only(
                        left: constraints.maxWidth * 0.1,
                        right: constraints.maxWidth * 0.1),
                    borderSide: BorderSide(
                        width: 4,
                        color: Theme.of(context)
                            .extension<Pallette>()!
                            .normalText)),
                isScrollable: true,
                controller: _tabController,
                tabs: const [
                  Center(child: Text('Following')),
                  Center(child: Text('For You'))
                ]));
  }

  @override
  void initState() {
    super.initState();
    //todo investigate crash on tabcontroller
    _tabController = TabController(vsync: this, length: 2);

    Get.find<FeedActionsController>().tabController = _tabController;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
