
import 'package:flutter_test/flutter_test.dart';
import 'package:signifydemo/feature/quote/domain/entity/quote_entity.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_state.dart';

import 'quote_bloc_test.dart';

void main(){
  group('QuoteState', () {
    final QuoteEntity mockData = AppData.quoteEntity;
    group('QuoteState, initialState', () {
      const mockStatus = QuoteStateEnum.initialState;
      QuoteState createObject(){
        return  QuoteState(
            quoteData: mockData,
            status: mockStatus,
            message: ''
        );
      }
      test('support value equality', () {
        expect(createObject(), equals(createObject()),);
      });
      test('prop are correct', () {
        expect(createObject().props, equals(<Object?>[mockStatus,mockData,'']),);
      });
      test('return object with updated status', () {
        expect(createObject().copyWith(
            status: QuoteStateEnum.initialState
        ),  QuoteState(quoteData: mockData,
            status: mockStatus), );
      });
    });
  });
}