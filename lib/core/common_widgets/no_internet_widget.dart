import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:signifydemo/core/util/app_theme.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_bloc.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_event.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Text(
                  "No Internet Connection",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  textStyle: Style.labelMedium(context),
                ),
                onPressed: () {
                  BlocProvider.of<QuoteBloc>(context).add(GetQuoteEvent());
                },
                child: Text(
                  'Try again',
                  style: Style.labelMedium(context),
                )),
          ],
        ),
      ),
    );
  }
}
