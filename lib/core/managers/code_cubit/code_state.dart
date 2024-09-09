part of 'code_cubit.dart';

@immutable
abstract class CodeState {}

class CodeInitial extends CodeState {}

class CodeLoading extends CodeState {}

class CodeSuccess extends CodeState {}

class CodeError extends CodeState {
  final String error;
  CodeError(this.error);
}
