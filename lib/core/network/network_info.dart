import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
   Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  InternetConnectionChecker? connectionChecker;
  NetworkInfoImpl([InternetConnectionChecker? connectionChecker]) {
    this.connectionChecker = connectionChecker ?? InternetConnectionChecker();
  }

  @override
  Future<bool> get isConnected => connectionChecker!.hasConnection;
}
