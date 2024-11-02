import 'package:dartz/dartz.dart';
import 'package:didyouknow/didyouknow/data/models/fact.dart';
import 'package:didyouknow/didyouknow/data/models/fact_details.dart';
import 'package:didyouknow/shared/models/repository_error.dart';

abstract class FactRepository {
  Future<Either<RepositoryError, Fact>> getFactOfTheDay();
  Future<Either<RepositoryError, FactDetails>> getFactDetails(String id);
}
