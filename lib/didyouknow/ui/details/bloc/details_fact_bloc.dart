import 'dart:math';

import 'package:didyouknow/didyouknow/data/models/fact.dart';
import 'package:didyouknow/didyouknow/data/models/fact_details.dart';
import 'package:didyouknow/didyouknow/data/repository/fact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'details_fact_event.dart';
part 'details_fact_state.dart';

class DetailsFactBloc extends Bloc<DetailsFactEvent, DetailsFactState> {
  DetailsFactBloc() : super(const LoadingDetailsFactState()) {
    on<GetFactDetails>(_getFactDetails);
  }

  Future<void> _getFactDetails(
    GetFactDetails event,
    Emitter<DetailsFactState> emit,
  ) async {
    emit(const LoadingDetailsFactState());
    final response = await _repository.getFactDetails(event.factId);
    response.fold(
      (l) => emit(ErrorDetailsFactState(message: l.error)),
      (r) => emit(SuccessDetailsFactState(r)),
    );
  }

  final FactRepository _repository = GetIt.instance.get<FactRepository>();
}
