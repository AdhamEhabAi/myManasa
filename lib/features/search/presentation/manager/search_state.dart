part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<CourseModel> courses;
  SearchLoaded(this.courses);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
