import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:signifydemo/feature/quote/domain/repository_impl/quote_repo.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_bloc.dart';

import '../../presentation_test/bloc_testing/quote_bloc_test.dart';
import 'quote_repo_testing.mocks.dart';


class MockQuoteBloc extends Mock implements QuoteBloc {}

class QuoteRepositoryTest extends Mock implements QuoteRepository{
}

@GenerateMocks([QuoteRepositoryTest,MockQuoteBloc])
Future<void> main() async {
  quoteRepoTesting();
}

quoteRepoTesting(){
  late MockQuoteRepositoryTest quoteRepositoryTest;
  setUpAll(() {
    quoteRepositoryTest = MockQuoteRepositoryTest();
  });
  group('Quote repo test', () {
    test('test fetchData', () async {
      final model = AppData.quoteEntity;
      when(quoteRepositoryTest.getQuote()).thenAnswer((_) async {
        return Right(model);
      });
      final res = await quoteRepositoryTest.getQuote();
      expect(res, Right(model));
    });

    test('test fetchData throws Exception', () {
      when(quoteRepositoryTest.getQuote()).thenAnswer((_) async {
        throw Exception();
      });
      final res = quoteRepositoryTest.getQuote();
      expect(res, throwsException);
    });
  });
}


