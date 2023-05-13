import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaylistView extends StatelessWidget {
  const PlaylistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/playlist.svg",
            width: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              alignment: Alignment.center,
              child: Text('Playlist - Unit 5: Period 5: 1844-1877',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          Theme.of(context).extension<Pallette>()!.normalText,
                      fontSize: 13,
                      fontWeight: FontWeight.w600))),
          const Spacer(),
          SvgPicture.asset(
            "assets/icons/chevron_right.svg",
            width: 11,
            height: 16,
          ),
        ],
      ),
    );
  }
}
