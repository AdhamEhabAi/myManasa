import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_manasa/constants.dart';
import 'package:my_manasa/core/utils/styles.dart';
import 'package:my_manasa/features/homeSubjects/presentation/views/course_view.dart';
import 'package:my_manasa/features/search/presentation/views/widgets/search_widget.dart';
import 'package:my_manasa/features/search/presentation/manager/search_cubit.dart';
import 'package:get/get.dart' as trans;

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.padding),
        child: Column(
          children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const CircularProgressIndicator();
                } else if (state is SearchError) {
                  return Center(child: Text(state.message, style: Styles.bold20));
                } else if (state is SearchLoaded) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.courses.length,
                      itemBuilder: (context, index) {
                        final course = state.courses[index];
                        return SearchWidget(title: course.name, onTap: () {
                          trans.Get.to(() => CourseView(course: course),
                            transition: trans.Transition.fade,
                          );
                        },);
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
