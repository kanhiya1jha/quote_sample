


import 'package:signifydemo/core/network/network_error.dart';
import 'package:signifydemo/core/network/network_manager.dart';
import 'package:signifydemo/core/util/app_api_constants.dart';
import 'package:signifydemo/feature/quote/data/data_source/quote_datasource.dart';
import 'package:signifydemo/feature/quote/data/models/quote_model.dart';

class QuoteDataSourceImpl implements QuoteDataSource {

  @override
  Future<QuoteModel?> getQuote() async {
      final url = Uri.parse(AppConstant.baseUrl);
      Map<String, dynamic> response = await ApiClient.instance.callNetworkAPI(url, type: RequestType.get);
      return QuoteModel.fromJson(response);
  }
}
