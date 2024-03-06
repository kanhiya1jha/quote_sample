import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String? id;
  final String? content;

  const QuoteEntity({
    this.id,
    this.content,
  });

  @override
  List<Object?> get props => [id, content];
}
