abstract class FeedController {
  Future<void> fetchMore(int count) async {}
  void toggleFlipCard(int id) {}
  void toggleLiked(int id) {}
  void toggleBookmarked(int id) {}
}
