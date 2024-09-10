import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/Quiz/data/model/exam_qusetion_model.dart';
import 'package:my_manasa/features/Quiz/repo/quiz_repo.dart';
import 'package:my_manasa/features/myCourses/data/models/quiz_homework_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizRepo quizRepo;

  QuizCubit(this.quizRepo) : super(QuizInitial());

  Future<void> fetchQuizzes({required String courseId}) async {
    emit(QuizLoading());
    final result = await quizRepo.getQuizzes(courseId: courseId);

    result.fold(
      (failure) => emit(QuizError(message: failure.message)),
      (quizzes) => emit(QuizLoaded(quizzes: quizzes)),
    );
  }

  Future<void> loadExamQuestions({required String quizId}) async {
    emit(ExamLoading());
    final result = await quizRepo.getExamQuestions(quizId: quizId);

    result.fold(
      (failure) => emit(ExamError(message: failure.message)),
      (questions) => emit(ExamLoaded(questions)),
    );
  }
}
