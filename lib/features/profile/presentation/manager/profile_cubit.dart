import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/profile/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> updateProfile({
    required String userId,
    required String currentPassword,
    required String year,
    required String lastName,
    required String firstName,
    String? newPassword,  // Made nullable
    String? confirmPassword,  // Made nullable
  }) async {
    emit(ProfileUpdating());

    final result = await profileRepo.updateProfile(
      userId: userId,
      currentPassword: currentPassword,
      year: year,
      lastName: lastName,
      firstName: firstName,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    result.fold(
          (failure) => emit(ProfileUpdateFailed(failure.message)),
          (successMessage) => emit(ProfileUpdated(successMessage)),
    );
  }
}
