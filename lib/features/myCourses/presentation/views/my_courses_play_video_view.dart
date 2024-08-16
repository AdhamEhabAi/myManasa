import 'package:flutter/material.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/core/widgets/custom_appbar.dart';
import 'package:my_manasa/features/myCourses/presentation/views/widgets/my_courses_video_course_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyCoursesPlayVideoView extends StatefulWidget {
  const MyCoursesPlayVideoView({super.key});

  @override
  State<MyCoursesPlayVideoView> createState() => _MyCoursesPlayVideoViewState();
}

class _MyCoursesPlayVideoViewState extends State<MyCoursesPlayVideoView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=eoAh_EgVuWw')!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MediaQuery.of(context).orientation == Orientation.landscape
            ? null
            : const CustomAppBar(
          title: '',
          backGroundColor: Colors.transparent,
        ),
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
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
                            'الدرس الاول',
                            style: Styles.semiBold24,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '20:00',
                            style: Styles.semiBold24,
                          ),
                          Image.asset('assets/images/small timer.png'),
                        ],
                      ),
                      Text(
                        'يحتوي هذة الكورس علي تأسيس كامل للصفوف و شرح و\nحل نماذج في الفيديو',
                        style: Styles.semiBold10.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    itemBuilder: (context, index) {
                      return MyCoursesVideoCourseWidget(onTap: () {

                      });
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: 4,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
