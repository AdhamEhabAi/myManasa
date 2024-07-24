import 'package:flutter/material.dart';
import 'package:my_manasa/features/home/presentation/views/widgets/video_course_widget.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const VideoCourseWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 4);
  }
}
