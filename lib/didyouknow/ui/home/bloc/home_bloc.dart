import 'dart:math';

import 'package:didyouknow/didyouknow/data/models/fact.dart';
import 'package:didyouknow/didyouknow/data/repository/fact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const LoadingHomeState()) {
    on<GetTodayFact>(_getFactOfTheDay);
  }

  Future<void> _getFactOfTheDay(
    GetTodayFact event,
    Emitter<HomeState> emit,
  ) async {
    emit(const LoadingHomeState());
    final response = await _repository.getFactOfTheDay();
    response.fold(
      (l) => emit(ErrorHomeState(message: l.error)),
      (r) => emit(SuccessHomeState(r)),
    );
  }

  final FactRepository _repository = GetIt.instance.get<FactRepository>();
}
