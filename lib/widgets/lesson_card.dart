import 'package:education_app/constants/icon.dart';
import 'package:flutter/material.dart';
import 'package:education_app/models/lessons.dart';

class LessonCard extends StatelessWidget {
  final Lessons lesson;
  const LessonCard({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        lesson.isPlaying
            ? Image.asset(
                icLearning,
                height: 45,
              )
            : Image.asset(
                icPlayNext,
                height: 45,
              ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                lesson.duration,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        lesson.isCompleted
            ? Image.asset(
                icDone,
                height: 20,
              )
            : Image.asset(
                icLock,
                height: 30,
              ),
      ],
    );
  }
}
