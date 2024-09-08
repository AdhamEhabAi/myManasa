import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/myCourses/presentation/manager/my_courses_cubit.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/widgets/video_course_widget.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    // Fetch videos from MyCoursesCubit
    BlocProvider.of<MyCoursesCubit>(context).fetchVideos(courseId: courseModel.id);

    return BlocBuilder<MyCoursesCubit, MyCoursesState>(
      builder: (context, state) {
        if (state is VideosLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is VideoLoadingSuccess) {
          if (state.videos.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return VideoCourseWidget(
                  videoModel: state.videos[index],
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
          return const Center(
              child: CircularProgressIndicator());
        }
      },
    );
  }
}
