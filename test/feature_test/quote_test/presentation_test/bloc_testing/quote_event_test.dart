
import 'package:flutter_test/flutter_test.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_event.dart';

void main(){
  group(QuoteEvent, () {
    group(GetQuoteEvent, () {
      test('support valu equility', () {
        expect(GetQuoteEvent(),   GetQuoteEvent());
      } );
      test('props are correct', () {
        expect( GetQuoteEvent().props, equals(<Object?>[]));
      } );
    });
  });
}