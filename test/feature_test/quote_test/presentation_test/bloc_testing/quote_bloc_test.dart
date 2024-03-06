
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:signifydemo/feature/quote/domain/entity/quote_entity.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_bloc.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_event.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_state.dart';

void main(){
  group("QuoteBloc", () {
    setUp(() {
    });
    QuoteBloc buildBloc() {
      return QuoteBloc();
    }
    group('constructor', () {
      test('work properly', () {
        expect(buildBloc, returnsNormally);
      });
      test('has correct initial state', () {
        expect(buildBloc().state, equals(const QuoteState()));
      });
    });

    group('QuoteFetchEvent ', () {
      blocTest('emit [success] when loaded from first time',
        build: () =>QuoteBloc(),
        act: (bloc) => bloc.add( GetQuoteEvent()),
        expect: () => [
          const QuoteState(
              status: QuoteStateEnum.initialState,
              message: 'Loading'
          ),
          const QuoteState(
              status: QuoteStateEnum.loadingState,
              message: 'Loading'
          ),
        ],
      );
    });
  });
}

class AppData{
  static QuoteEntity quoteEntity =  const QuoteEntity(
    id: '',
    content: '',
  );
}