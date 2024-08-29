import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherInitial());
}
