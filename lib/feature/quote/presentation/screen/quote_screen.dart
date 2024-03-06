import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:signifydemo/core/common_widgets/app_bar_widget.dart';

import 'package:signifydemo/core/common_widgets/error_widget.dart';
import 'package:signifydemo/core/util/app_theme.dart';
import 'package:signifydemo/core/util/social_share.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_bloc.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_event.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_state.dart';
import 'package:signifydemo/feature/quote/presentation/screen/quote_slide_widget.dart';

import 'accelerometer_widget.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuoteBloc>(
      create: (context) => QuoteBloc()..add(GetQuoteEvent()),
      child: const QuotePage(),
    );
  }
}

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menuCallbackFunction: (menuItem) {
          switch (menuItem) {
            case MenuItem.gps || MenuItem.accelerometer || MenuItem.rate:
              showAlertDilog(context,menuItem);
              break;
            case MenuItem.twitter || MenuItem.facebook || MenuItem.share:
              BlocProvider.of<QuoteBloc>(context).add(QuoteMenuEvent(menuItem));
              break;
          }
        },
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          switch (state.status) {
            case QuoteStateEnum.initialState:
              break;
            case QuoteStateEnum.loadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case QuoteStateEnum.loadedState:
              return QuoteSlideWidget(
                  quoteMessage: state.quoteData?.content ?? "");
            case QuoteStateEnum.errorState:
              return ErrorMessageWidget(errorMessage: state.message);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<void> showAlertDilog(BuildContext context, MenuItem menuType) async {
    switch (menuType) {
      case  MenuItem.rate:
        _showRatingDialog(context);
        break;
      case MenuItem.gps:
        showCurrentLocation(context);
        break;
      case  MenuItem.accelerometer:
        showAccelerometerData(context);
        break;
      case MenuItem.twitter || MenuItem.facebook || MenuItem.share:
        break;
    }
  }

  Future<void> showCurrentLocation(BuildContext context) async {
    Placemark place = await SocialShare.getCurrentLocation();
    print('${place.country}, ${place.street}');
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              '${place.country}, ${place.street}',
              style: Style.labelMedium(context),
            ),
          );
        });
  }
  Future<void> showAccelerometerData(BuildContext context)  {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: AccelerometerWidget()
          );
        });
  }

  void _showRatingDialog(BuildContext context) {
    final _dialog = RatingDialog(
      initialRating: 1.0,
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

      },
    );
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }
}
