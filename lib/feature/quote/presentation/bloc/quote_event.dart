
import 'package:equatable/equatable.dart';
import 'package:signifydemo/core/common_widgets/app_bar_widget.dart';

abstract class QuoteEvent extends Equatable{
  const QuoteEvent();
}

class GetQuoteEvent extends QuoteEvent {
  List<Object> get props => [];
}
class QuoteMenuEvent extends QuoteEvent {
  final MenuItem item;
  const QuoteMenuEvent(this.item);
  @override
  List<Object> get props => [item];
}