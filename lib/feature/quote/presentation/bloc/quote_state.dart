import 'package:equatable/equatable.dart';
import 'package:signifydemo/feature/quote/domain/entity/quote_entity.dart';

enum QuoteStateEnum {
  initialState,
  loadingState,
  loadedState,
  errorState,
}

class QuoteState extends Equatable {
  final QuoteEntity? quoteData;
  final QuoteStateEnum status;
  final String message;

  const QuoteState({
    this.status = QuoteStateEnum.initialState,
    this.quoteData,
    this.message = "",
  });

  @override
  List<Object?> get props => [status, quoteData, message];

  QuoteState copyWith({
    QuoteEntity? data,
    QuoteStateEnum? status,
    String? message,
  }) {
    return QuoteState(
        quoteData: data ?? quoteData,
        status: status ?? this.status,
        message: message ?? this.message);
  }
}
