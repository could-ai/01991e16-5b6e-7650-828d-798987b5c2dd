import 'package:couldai_user_app/models/story_model.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final Story story;

  const StoryWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.pink,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(story.avatarUrl),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(story.username),
        ],
      ),
    );
  }
}
