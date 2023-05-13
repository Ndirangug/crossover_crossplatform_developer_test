import 'package:flutter/material.dart';

class ContentInfo extends StatelessWidget {
  const ContentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black.withOpacity(0.2),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                "AP US History",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18),
              ),
            ),
            Text(
              "Topic 5.2: Manifest Destiny #apush5_1",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15),
            )
          ]),
    );
  }
}
