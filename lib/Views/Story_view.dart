import 'package:flutter/material.dart';

import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_image.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  final controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // child: StoryView(
          //   key: ,
          //
          //   storyItems: [
          //     StoryItem.text(
          //       title: "Welcome to the Story",
          //       backgroundColor: Colors.blue,
          //     ),
          //     StoryItem.pageImage(
          //       url: "https://example.com/image.jpg",
          //       controller: controller,
          //     ),
          //     // StoryItem(
          //     //   url: "https://example.com/animated.gif",
          //     //   controller: controller,
          //     // ),
          //   ],
          //   controller: controller,
          //   repeat: false, // To repeat the stories
          //   onStoryShow: (s) {
          //     print("Showing a story");
          //   },
          //   onComplete: () {
          //     print("Completed a cycle");
          //   },
          //   onVerticalSwipeComplete: (direction) {
          //     if (direction == Direction.down) {
          //       Navigator.pop(context);
          //     }
          //   },
          // ),
          ),
    );
  }
}
