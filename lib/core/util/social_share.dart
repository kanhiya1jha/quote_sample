
import 'package:flutter/foundation.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:signifydemo/core/common_widgets/app_bar_widget.dart';

class SocialShare {
  static Future<void> onShare(MenuItem share, String quote) async {
    await Share.share(quote);
  }
  static Future<void> onShareTwitterQuote(MenuItem share, String quote) async {
    String? response;
    final FlutterShareMe share = FlutterShareMe();
    await share.shareToTwitter(msg: quote);
    debugPrint(response);
  }
  static Future<void> onShareFacebookQuote(MenuItem share, String quote) async {
    String? response;
    final FlutterShareMe share = FlutterShareMe();
    await share.shareToFacebook(msg: quote);
    debugPrint(response);
  }
  static Future<Placemark> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.latitude);
    Placemark place = placemarks[0];
    print('${place.country}, ${place.street}');
    print(position);
    return place;
  }
}

