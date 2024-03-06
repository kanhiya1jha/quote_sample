import 'package:dartz/dartz.dart';
import 'package:signifydemo/core/error/failure.dart';
import 'package:signifydemo/feature/quote/domain/entity/quote_entity.dart';

abstract class QuoteRepository {
  Future<Either<Failure, QuoteEntity>?> getQuote();
}
