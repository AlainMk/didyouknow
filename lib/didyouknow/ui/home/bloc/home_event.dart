part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetTodayFact extends HomeEvent {
  const GetTodayFact();

  @override
  List<Object?> get props => [];
}
