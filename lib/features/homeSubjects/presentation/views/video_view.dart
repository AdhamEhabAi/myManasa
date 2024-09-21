import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_manasa/core/managers/video_cubit/video_cubit.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/toast_m.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_course_widget.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_courses_play_video_view.dart';

class VideoView extends StatelessWidget {
  const VideoView(
      {super.key, required this.courseModel, required this.isOwned});
  final CourseModel courseModel;
  final bool isOwned;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VideoCubit>(context).fetchVideos(courseId: courseModel.id);

    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideosLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VideoLoadingSuccess) {
          if (state.videos.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return VideoCourseWidget(
                  videoModel: state.videos[index],
                  isOwned: isOwned, // Pass ownership status
                  onTap: () {
                    if (isOwned) {
                      // Navigate to MyCoursesPlayVideoView using Get
                      Get.to(() => MyCoursesPlayVideoView(
                            video: state.videos[index],
                            course: courseModel,
                          ));
                    } else {
                      // Show a message or prompt to buy the course
                      ToastM.show('الرجاء شراء الكورس لمشاهدة الفيديو');
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: state.videos.length,
            );
          } else {
            return Center(
              child: Text(
                'No videos available.',
                style: Styles.semiBold20,
              ),
            );
          }
        } else if (state is VideosError) {
          return Center(
            child: Text(
              state.errMessage,
              style: Styles.semiBold20,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
