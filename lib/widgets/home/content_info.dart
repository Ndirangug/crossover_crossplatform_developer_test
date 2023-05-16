import 'package:detectable_text_field/detectable_text_field.dart';
import 'package:detectable_text_field/detector/sample_regular_expressions.dart';
import 'package:flutter/material.dart';

class ContentInfo extends StatelessWidget {
  final String user;
  final String description;
  const ContentInfo({super.key, required this.user, required this.description});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((context, constraints) => SizedBox(
              width: constraints.maxWidth,
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
                    Expanded(
                      child: SizedBox(
                        width: constraints.maxWidth,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: constraints.maxWidth,
                              child: DetectableText(
                                text: description,
                                overflow: TextOverflow.visible,
                                detectionRegExp: hashTagRegExp,
                                detectedStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                basicStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 15),
                                onTap: (p) {},
                              ),
                            )),
                      ),
                    )
                  ]),
            )));
  }
}
