import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

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
      child: const Center(
        child: Text("Bookmarks"),
      ),
    );
  }
}
