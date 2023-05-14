import 'package:flutter/material.dart';

class ContentInfo extends StatelessWidget {
  final String user;
  final String description;
  const ContentInfo({super.key, required this.user, required this.description});

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
                user,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 18),
              ),
            ),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15),
            )
          ]),
    );
  }
}
