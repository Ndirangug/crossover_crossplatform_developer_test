import 'package:crossover_test/widgets/home/content_info.dart';
import 'package:crossover_test/widgets/home/feed_actions.dart';
import 'package:crossover_test/widgets/home/playlist_view.dart';
import 'package:crossover_test/widgets/home/user_avatar.dart';
import 'package:flutter/material.dart';

class Swippable extends StatelessWidget {
  const Swippable({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.04,
                          vertical: constraints.maxWidth * 0.04),
                      width: constraints.maxWidth,
                      child: Container(
                          color: Colors.white.withOpacity(0.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context, constraints) => Container(
                                    height: constraints.maxHeight,
                                    width: constraints.maxWidth,
                                    margin: EdgeInsets.only(
                                        right: constraints.maxWidth * 0.02),
                                    color: Colors.white.withOpacity(0.7),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            height: 45,
                                            width: constraints.maxWidth,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: constraints.maxHeight *
                                                    0.04),
                                            height: constraints.maxHeight * 0.1,
                                            width: constraints.maxWidth,
                                            child: const ContentInfo(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  width: constraints.maxWidth * 0.13,
                                  height: constraints.maxHeight,
                                  color: Colors.white.withOpacity(0.5),
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          child: const UserAvatar(width: 45)),
                                      FeedActions(
                                        spacing: 12,
                                        items: [
                                          ActionItem(
                                              icon: "like",
                                              label: "23",
                                              onTap: () {}),
                                          ActionItem(
                                              icon: "comment",
                                              label: "23",
                                              onTap: () {}),
                                          ActionItem(
                                              icon: "share",
                                              label: "23",
                                              onTap: () {}),
                                          ActionItem(
                                              icon: "bookmarks",
                                              label: "23",
                                              onTap: () {}),
                                          ActionItem(
                                              icon: "flip",
                                              label: "Flip",
                                              onTap: () {})
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: constraints.maxHeight * 0.05,
                        child: const PlaylistView()),
                  ),
                ],
              ),
            ));
  }
}
