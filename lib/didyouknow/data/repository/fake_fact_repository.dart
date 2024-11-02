import 'package:dartz/dartz.dart';
import 'package:didyouknow/didyouknow/data/api/fact_api.dart';
import 'package:didyouknow/didyouknow/data/models/fact.dart';
import 'package:didyouknow/didyouknow/data/models/fact_details.dart';
import 'package:didyouknow/didyouknow/data/repository/fact_repository.dart';
import 'package:didyouknow/shared/models/repository_error.dart';
import 'package:get_it/get_it.dart';

class FakeFactRepository implements FactRepository {
  final FactApi _api = GetIt.instance.get<FactApi>();

  @override
  Future<Either<RepositoryError, Fact>> getFactOfTheDay() async {
    try {
      final fact = await _api.loadFactOfTheDay();
      return Right(fact);
    } catch (error, stackTrace) {
      return Left(RepositoryError(error: error, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<RepositoryError, FactDetails>> getFactDetails(String id) async {
    try {
      final details = await _api.loadFactDetails(id);
      if (details == null) {
        return Left(RepositoryError(error: 'Fact details not found'));
      }
      return Right(details);
    } catch (error, stackTrace) {
      return Left(RepositoryError(error: error, stackTrace: stackTrace));
    }
  }
}
