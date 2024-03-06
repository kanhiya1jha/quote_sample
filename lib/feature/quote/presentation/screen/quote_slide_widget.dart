import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signifydemo/core/util/app_theme.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_bloc.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_event.dart';

class QuoteSlideWidget extends StatelessWidget {
  final String quoteMessage;

  const QuoteSlideWidget({super.key, required this.quoteMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              key: Key('back'),
              onPressed: () {
                BlocProvider.of<QuoteBloc>(context).add(GetQuoteEvent());
              },
              icon: const Icon(Icons.arrow_back)),
          Expanded(
            child: IntrinsicHeight(
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          key: Key('quote'),
                          quoteMessage,
                          style: Style.labelMedium(context),
                          //ScreenType.isSmallScreen(context) ?  Theme.of(context).textTheme.labelMedium :Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Text(
                          key: Key('author'),
                          'kanhiya',
                          style: Style.labelMedium(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
              key: Key('next'),
              onPressed: () {
                BlocProvider.of<QuoteBloc>(context).add(GetQuoteEvent());
              },
              icon: const Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}
