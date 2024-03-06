
import 'package:realm/realm.dart';
import 'package:signifydemo/core/local_database/quote_realm_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class QuoteLocalDataSource {
  Future<RealmResults<QuoteRealmModel>> getQuoteListing();
  Future<RealmResults<QuoteRealmModel>> deleteQuoteProductItem(QuoteRealmModel quote);
  Future<bool> saveQuote(QuoteRealmModel quote);
}

class QuoteLocalDataSourceImpl extends QuoteLocalDataSource {
  Realm? realm;
  QuoteLocalDataSourceImpl([Realm? realm]) {
    this.realm = realm ?? Realm(Configuration.local([QuoteRealmModel.schema]));
  }
  @override
  Future<RealmResults<QuoteRealmModel>> getQuoteListing() {
    final allQuote = realm!.all<QuoteRealmModel>();
    return Future.value(allQuote);
  }

  @override
  Future<RealmResults<QuoteRealmModel>> deleteQuoteProductItem(QuoteRealmModel quote) {
    realm!.write(() {
      realm!.delete(quote);
    });
    final allProduct = realm!.all<QuoteRealmModel>();
    return Future.value(allProduct);
  }

  @override
  Future<bool> saveQuote(QuoteRealmModel quote) {
    final selectedProduct = realm!.query<QuoteRealmModel>('id == "${quote.id}"');
    if (selectedProduct.isEmpty) {
      realm!.write(() {
        realm!.add(quote);
      });
      return Future.value(true);
    }
    return Future.value(false);
  }
}
