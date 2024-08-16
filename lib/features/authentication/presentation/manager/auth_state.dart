part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class PhoneNumberFound extends AuthState {}
final class PhoneNumberNotFound extends AuthState {}


final class PhoneNumberOTPValid extends AuthState {}
final class PhoneNumberOTPNOTValid extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

final class RegisterSuccess extends AuthState {}
final class RegisterLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}
final class LoginSuccess extends AuthState {}
final class LoginLoading extends AuthState {}




