import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/core/app_repository/code_repo.dart';

part 'code_state.dart';

class CodeCubit extends Cubit<CodeState> {
  final CodeRepo codeRepo;

  CodeCubit(this.codeRepo) : super(CodeInitial());

  Future<void> purchaseCourse({
    required String userId,
    required String code,
    String? idCourse,
  }) async {
    emit(CodeLoading());

    // Call the repository method with optional idCourse
    final result = await codeRepo.purchaseCourse(
      userId: userId,
      code: code,
      idCourse: idCourse,
    );

    result.fold(
          (failure) => emit(CodeError(failure.message)),
          (success) => emit(CodeSuccess()),
    );
  }
}
