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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    BlocProvider.of<VideoCubit>(context).fetchVideos(courseId: widget.course.id);
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
    return WillPopScope(
      onWillPop: () async {
        // Navigate to MyCourseView on back button or gesture
        Get.off(MyCourseView(course: widget.course));
        return false; // Return false to prevent default back navigation
      },
      child: SafeArea(
        child: Scaffold(
          appBar: MediaQuery.of(context).orientation == Orientation.landscape
              ? null
              : AppBar(
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Get.off(MyCourseView(course: widget.course));
                },
                icon: ImageIcon(
                  const AssetImage(
                    'assets/images/back.png',
                  ),
                  size: 34.w,
                  color: AppColors.primaryColor,
                )),
            actions: [
              Image.asset(
                'assets/images/logo.png',
                color: AppColors.primaryColor,
                width: 40.w,
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
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _currentVideo!.name,
                                      maxLines: 2,
                                      style: Styles.semiBold24.copyWith(fontSize: 24.sp),
                                      overflow: TextOverflow.ellipsis, // Prevent overflow
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'يحتوي هذا الكورس علي تأسيس كامل للصفوف و شرح و\nحل نماذج في الفيديو',
                                style: Styles.semiBold10.copyWith(color: Colors.grey, fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            itemBuilder: (context, index) {
                              final video = _videos[index];
                              return MyCoursesVideoCourseWidget(
                                onTap: () => _onVideoTap(video),
                                title: video.name,
                                dis: video.dis!,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 20.h),
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
      ),
    );
  }
}
