import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/search/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> searchCourses({required String courseName}) async {
    emit(SearchLoading());
    final result = await searchRepo.getCoursesBySearch(courseName: courseName);
    result.fold(
          (failure) => emit(SearchError(failure.message)),
          (courses) => emit(SearchLoaded(courses)),
    );
  }
}
