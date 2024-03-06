import 'package:realm/realm.dart';
part 'quote_realm_model.g.dart';

@RealmModel()
class _QuoteRealmModel {
  @PrimaryKey()
  late String id;
  late String content;
  late String author;

}
