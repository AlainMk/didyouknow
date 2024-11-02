part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

class LoadingHomeState extends HomeState {
  const LoadingHomeState();

  @override
  List<Object?> get props => [];
}

class ErrorHomeState extends HomeState {
  const ErrorHomeState({this.message = 'An error occurred'});

  final String message;

  @override
  List<Object?> get props => [message];
}

class SuccessHomeState extends HomeState {
  const SuccessHomeState(this._fact);

  final Fact _fact;

  Fact get fact => _fact;

  String get factTitle => _fact.title;
  String get factDescription => _fact.factSnippet;
  String get factImageUrl {
    final random = Random();
    return "https://picsum.photos/seed/${random.nextInt(100) + 300}/${random.nextInt(100) + 300}";
  }

  String get factType => _fact.type.name.toUpperCase();

  String get likeCount {
    final random = Random();
    return random.nextInt(100).toString();
  }

  @override
  List<Object?> get props => [_fact];
}
