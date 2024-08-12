import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoriesComponent extends StatefulWidget {
  const StoriesComponent({super.key});

  @override
  State<StoriesComponent> createState() => _StoriesComponentState();
}

class _StoriesComponentState extends State<StoriesComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffF3F7EC),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(35))),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('StoryView');
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.red),
            ),
          )
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('StoryView');
          //   },
          //   child: Container(
          //     height: 100,
          //     width: 100,
          //     decoration:
          //         BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          //   ),
          // )
          // StoryView(
          //   storyItems: [
          //     StoryItem.text(title: "Hello", backgroundColor: Colors.blue),
          //     StoryItem.pageImage(
          //         url:
          //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg4t7kpY_Dz5fiYkZ  vxw_bJ6h9bksLuR61FA&s",
          //         controller: controller)
          //   ],
          //   controller: controller,
          //   inline: false,
          //   repeat: false,
          // )
        ],
      ),
    );
  }
}
