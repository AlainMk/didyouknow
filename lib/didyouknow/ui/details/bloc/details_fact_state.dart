part of 'details_fact_bloc.dart';

sealed class DetailsFactState extends Equatable {
  const DetailsFactState();
}

class LoadingDetailsFactState extends DetailsFactState {
  const LoadingDetailsFactState();

  @override
  List<Object?> get props => [];
}

class ErrorDetailsFactState extends DetailsFactState {
  const ErrorDetailsFactState({this.message = 'An error occurred'});

  final String message;

  @override
  List<Object?> get props => [message];
}

class SuccessDetailsFactState extends DetailsFactState {
  const SuccessDetailsFactState(this._fact);

  final FactDetails _fact;

  FactDetails get fact => _fact;

  String get factTitle => _fact.title;
  String get factDescription => _fact.factSnippet;

  String get factImageUrl {
    final random = Random();
    return "https://picsum.photos/seed/${random.nextInt(100) + 300}/${random.nextInt(100) + 300}";
  }

  ContentType get factType => _fact.type;

  List<SlideItem> get slideItems {
    return _fact.slides.map((e) => SlideItem(e)).toList();
  }

  @override
  List<Object?> get props => [_fact];
}

class SlideItem {
  SlideItem(this._slide);

  final FactSlide _slide;

  String get slideTitle => _slide.title;

  String get slideDescription => _slide.description;

  String get slideImageUrl {
    final random = Random();
    return "https://picsum.photos/seed/${random.nextInt(100) + 300}/${random.nextInt(100) + 300}";
  }

  String get slideVideoUrl {
    return "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4";
  }
}
