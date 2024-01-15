part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class RecentJobsSuccessfully extends HomeState {}
class RecentJobsLoading extends HomeState {}
class RecentJobsError extends HomeState {}

class SuggestJobsSuccessfully extends HomeState {}
class SuggestJobsLoading extends HomeState {}
class SuggestJobsError extends HomeState {}

class SavedJobsSuccessfully extends HomeState {}
class SavedJobsLoading extends HomeState {}
class SavedJobsError extends HomeState {}

class AddSavedJobsSuccessfully extends HomeState {}
class AddSavedJobsLoading extends HomeState {}
class AddSavedJobsError extends HomeState {}

class RemoveSavedLoadingState extends HomeState {}
class RemoveSavedSuccessfullyState extends HomeState {}
class RemoveSavedErrorState extends HomeState {}

