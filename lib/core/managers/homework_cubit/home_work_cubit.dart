import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/core/app_repository/homework_repo.dart';
import 'package:my_manasa/features/myCourses/data/models/quiz_homework_model.dart';


part 'home_work_state.dart';

class HomeWorkCubit extends Cubit<HomeWorkState> {
  final HomeWorkRepo homeWorkRepo;

  HomeWorkCubit(this.homeWorkRepo) : super(HomeWorkInitial());

  Future<void> fetchHomeWorks(String courseId) async {
    emit(HomeWorkLoading());

    final result = await homeWorkRepo.getHomeWorks(courseId: courseId);

    result.fold(
          (failure) => emit(HomeWorkError(failure.message)),
          (homeWorks) => emit(HomeWorkLoaded(homeWorks)),
    );
  }
}
