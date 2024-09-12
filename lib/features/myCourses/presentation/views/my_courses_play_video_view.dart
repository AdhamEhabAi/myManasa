import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/managers/video_cubit/video_cubit.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/myCourses/presentation/views/my_course_view.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_courses_video_course_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/models/video_model.dart';

class MyCoursesPlayVideoView extends StatefulWidget {
  const MyCoursesPlayVideoView({
    super.key,
    required this.video,
    required this.course,
  });

  final VideoModel video;
  final CourseModel course;

  @override
  State<MyCoursesPlayVideoView> createState() => _MyCoursesPlayVideoViewState();
}

class _MyCoursesPlayVideoViewState extends State<MyCoursesPlayVideoView> {
  late YoutubePlayerController _controller;
  List<VideoModel> _videos = [];
  VideoModel? _currentVideo;

  @override
  void initState() {
    super.initState();
    _currentVideo = widget.video;
    _initializePlayer(_currentVideo!.firstUrl);
    BlocProvider.of<VideoCubit>(context)
        .fetchVideos(courseId: widget.course.id);
  }

  void _initializePlayer(String videoUrl) {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void _onVideoTap(VideoModel video) {
    if (_currentVideo?.firstUrl != video.firstUrl) {
      setState(() {
        _currentVideo = video;
        _controller.load(YoutubePlayer.convertUrlToId(video.firstUrl)!);
      });
    }
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MediaQuery.of(context).orientation == Orientation.landscape
            ? null
            : AppBar(
                elevation: 0.0,
                leading: IconButton(
                    onPressed: () {
                      Get.off(MyCourseView(
                        course: widget.course,
                      ));
                    },
                    icon: ImageIcon(
                      const AssetImage(
                        'assets/images/back.png',
                      ),
                      size: 34,
                      color: AppColors.primaryColor,
                    )),
                actions: [
                  Image.asset(
                    'assets/images/logo.png',
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
        body: BlocBuilder<VideoCubit, VideoState>(
          builder: (context, state) {
            if (state is VideosLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VideosError) {
              return Center(child: Text(state.errMessage));
            } else if (state is VideoLoadingSuccess) {
              _videos = state.videos;
              if (_videos.isEmpty) {
                return const Center(child: Text('No videos available.'));
              }

              return YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    log('Player is ready.');
                  },
                ),
                builder: (context, player) {
                  return Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: player,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  _currentVideo!.name,
                                  style: Styles.semiBold24,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '20:00', // Placeholder for video duration
                                  style: Styles.semiBold24,
                                ),
                                Image.asset('assets/images/small timer.png'),
                              ],
                            ),
                            Text(
                              'يحتوي هذا الكورس علي تأسيس كامل للصفوف و شرح و\nحل نماذج في الفيديو',
                              style: Styles.semiBold10
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          itemBuilder: (context, index) {
                            final video = _videos[index];
                            return MyCoursesVideoCourseWidget(
                              onTap: () => _onVideoTap(video),
                              title: video.name,
                              dis: video.dis!,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: _videos.length,
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
