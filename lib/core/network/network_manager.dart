import 'dart:convert';
import 'package:http/http.dart' as http;
import 'network_error.dart';
import 'network_info.dart';

class ApiClient {
  static final instance = ApiClient._internal();
  final http.Client client = http.Client();
  ApiClient._internal(); // private constructor

  Future<Map<String, dynamic>> callNetworkAPI(Uri url,{Object? body,required RequestType type}) async {
    final requestHeader = {'Content-Type': 'application/json'};
    try{
      final http.Response?  response;
      switch(type){
        case RequestType.get:
          response =  await client.get(url, headers: requestHeader);
          break;
        case RequestType.post:
          response =  await client.post(url, headers: requestHeader, body: body);
          break;
        case RequestType.put:
          response =  await client.put(url, headers: requestHeader, body: body);
          break;
        default:
          response =  await client.get(url, headers: requestHeader);
      }
      switch(response.statusCode){
        case 200:
          try {
            final data = jsonDecode(response.body);
            return data;
          } catch (e) {
            return throw DataParseError(Exception(e.toString()));
          }
        case 401:
          return throw DataHttpError(HttpException.unAuthorized);
        case 500:
          return throw DataHttpError(HttpException.internalServerError);
        default:
          return throw DataHttpError(HttpException.unknown);
      }
    }catch (error){
      if(!await NetworkInfoImpl().isConnected) {
        return throw DataNetworkError(NetworkException.noInternetConnection);
      }
      return throw DataHttpError(HttpException.unknown);
    }
  }
}
