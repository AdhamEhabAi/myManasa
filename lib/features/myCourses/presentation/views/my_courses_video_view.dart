import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;
import 'package:my_manasa/core/managers/video_cubit/video_cubit.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_play_video_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_courses_video_course_widget.dart';

class MyCoursesVideoView extends StatelessWidget {
  const MyCoursesVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VideoCubit>(context).fetchVideos(courseId: '1538');

    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideosLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VideosError) {
          return Center(child: Text(state.errMessage));
        } else if (state is VideoLoadingSuccess) {
          final videos = state.videos;
          return ListView.separated(
            itemBuilder: (context, index) {
              final video = videos[index];
              return MyCoursesVideoCourseWidget(
                onTap: () {
                  g.Get.to(
                    MyCoursesPlayVideoView(video: video, courseId: '1538',),
                    transition: g.Transition.fade,
                  );
                },
                title: video.name,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: videos.length,
          );
        } else {
          return const Center(child: Text('حدث خطأ غير متوقع.'));
        }
      },
    );
  }
}
