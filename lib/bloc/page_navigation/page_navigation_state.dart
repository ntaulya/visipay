part of 'page_navigation_bloc.dart';

@immutable
abstract class PageNavigationState {}

//kondisi awal
class PageNavigationInitial extends PageNavigationState {}

//lagi proses
class PageNavigationLoading extends PageNavigationState {}

//kalau gagal
class PageNavigationError extends PageNavigationState {
  final String error_message;

  PageNavigationError(this.error_message);
}

//kalau berhasil
class PageNavigationSuccess extends PageNavigationState {}
