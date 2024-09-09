import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/core/app_repository/code_repo.dart';


part 'code_state.dart';

class CodeCubit extends Cubit<CodeState> {
  final CodeRepo codeRepo;

  CodeCubit(this.codeRepo) : super(CodeInitial());

  Future<void> purchaseCourse({required String userId, required String code}) async {
    emit(CodeLoading());
    final result = await codeRepo.purchaseCourse(userId: userId, code: code);
    result.fold(
          (failure) => emit(CodeError(failure.message)),
          (success) => emit(CodeSuccess()),
    );
  }
}
