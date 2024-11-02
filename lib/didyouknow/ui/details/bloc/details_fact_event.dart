part of 'details_fact_bloc.dart';

sealed class DetailsFactEvent extends Equatable {
  const DetailsFactEvent();
}

class GetFactDetails extends DetailsFactEvent {
  const GetFactDetails(this.factId);

  final String factId;

  @override
  List<Object?> get props => [factId];
}
