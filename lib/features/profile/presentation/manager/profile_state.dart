part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final String message;
  ProfileUpdated(this.message);
}

class ProfileUpdateFailed extends ProfileState {
  final String message;
  ProfileUpdateFailed(this.message);
}
