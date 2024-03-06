import 'package:dartz/dartz.dart';

import 'package:signifydemo/core/error/failure.dart';
import 'package:signifydemo/core/network/network_info.dart';
import 'package:signifydemo/feature/quote/data/data_source/quote_datasource_impl.dart';
import 'package:signifydemo/feature/quote/domain/entity/quote_entity.dart';
import 'package:signifydemo/feature/quote/domain/repository_impl/quote_repo.dart';

class QuoteRepositoryImpl implements QuoteRepository {
   QuoteDataSourceImpl? QuoteDataSource;
   NetworkInfoImpl? networkInfo;

  QuoteRepositoryImpl({QuoteDataSourceImpl? QuoteDataSource, NetworkInfoImpl? networkInfo}){
    this.QuoteDataSource = QuoteDataSource ?? QuoteDataSourceImpl();
    this.networkInfo = networkInfo ?? NetworkInfoImpl();
  }

  @override
  Future<Either<Failure, QuoteEntity>> getQuote() async {
    if (await networkInfo?.isConnected == true) {
      try {
        final data = await QuoteDataSource?.getQuote();
        if (data != null) {
          QuoteEntity quoteEntity = QuoteEntity(id: data.id, content: data.content);
          return right(quoteEntity);
        } else {
          return left(ServerFailure());
        }
      } catch (error) {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
