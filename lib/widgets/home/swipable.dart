import 'package:crossover_test/controllers/feed_actions_controller.dart';
import 'package:crossover_test/models/flashcard.dart';
import 'package:crossover_test/models/mcq.dart';
import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/content_info.dart';
import 'package:crossover_test/widgets/home/feed_actions.dart';
import 'package:crossover_test/widgets/home/playlist_view.dart';
import 'package:crossover_test/widgets/home/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Swippable extends StatelessWidget {
  final FlashCard? flashCard;
  final MCQ? mcq;
  Swippable({super.key, this.flashCard, this.mcq});
  final FeedActionsController _feedActionsController = Get.find();

  bool get isFlashCard => flashCard != null;

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
                          // color: Colors.white.withOpacity(0.3),
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
                                //color: Colors.white.withOpacity(0.7),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.black.withOpacity(0.3),
                                        height: 45,
                                        width: constraints.maxWidth,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: constraints.maxHeight * 0.04),
                                        height: constraints.maxHeight * 0.1,
                                        width: constraints.maxWidth,
                                        child: ContentInfo(
                                          user: isFlashCard
                                              ? flashCard!.user.name
                                              : mcq!.user.name,
                                          description: isFlashCard
                                              ? flashCard!.description
                                              : mcq!.description,
                                        ),
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
                              // color: Colors.white.withOpacity(0.5),
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child: UserAvatar(
                                        width: 45,
                                        avatarUrl: isFlashCard
                                            ? flashCard!.user.avatar
                                            : mcq!.user.avatar,
                                      )),
                                  Obx(() => FeedActions(
                                        spacing: 18,
                                        items: [
                                          ActionItem(
                                              icon: "like",
                                              label:
                                                  "${_feedActionsController.likes}",
                                              color: _feedActionsController
                                                      .isLiked
                                                  ? Theme.of(context)
                                                      .extension<Pallette>()!
                                                      .error
                                                  : Theme.of(context)
                                                      .extension<Pallette>()!
                                                      .normalText,
                                              onTap: _feedActionsController
                                                  .toggleLike),
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
                                              label:
                                                  "${_feedActionsController.bookmarks}",
                                              color: _feedActionsController
                                                      .isBookmarked
                                                  ? Theme.of(context)
                                                      .extension<Pallette>()!
                                                      .tertiary3
                                                  : Theme.of(context)
                                                      .extension<Pallette>()!
                                                      .normalText,
                                              onTap: _feedActionsController
                                                  .toggleBookmark),
                                          ActionItem(
                                              icon: "flip",
                                              label: "Flip",
                                              onTap: () {})
                                        ],
                                      ))
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
                        child: PlaylistView(
                          playlistName:
                              isFlashCard ? flashCard!.playlist : mcq!.playlist,
                        )),
                  ),
                ],
              ),
            ));
  }
}
