import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signifydemo/core/common_widgets/app_bar_widget.dart';
import 'package:signifydemo/core/error/failure.dart';
import 'package:signifydemo/core/util/app_constants_string.dart';
import 'package:signifydemo/core/util/social_share.dart';
import 'package:signifydemo/feature/quote/data/repository/quote_repo.dart';
import 'package:signifydemo/feature/quote/domain/repository_impl/quote_repo.dart';
import 'package:signifydemo/feature/quote/presentation/bloc/quote_state.dart';
import 'quote_event.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteRepository? repository;

  QuoteBloc([QuoteRepository? repository]) : super(const QuoteState()) {
    this.repository = repository ?? QuoteRepositoryImpl();
    on<QuoteEvent>(_onFetchEvent);
    on<QuoteMenuEvent>(_onQuoteMenuEvent);
  }

  FutureOr<void> _onFetchEvent(
      QuoteEvent event, Emitter<QuoteState> emit) async {
    emit(state.copyWith(
        status: QuoteStateEnum.initialState,
        message: AppStringConstant.loading));
    emit(state.copyWith(
        status: QuoteStateEnum.loadingState,
        message: AppStringConstant.loading));
    final failureOrPerson = await repository!.getQuote();
    failureOrPerson?.fold(
        (failure) => emit(state.copyWith(
            status: QuoteStateEnum.errorState,
            message: _mapFailureToMessage(failure))), (items) {
      //  QuoteRealmModel model = QuoteRealmModel(items.id??'',items.content?? '','');
      // QuoteLocalDataSourceImpl.instance.saveQuote(model);

      emit(state.copyWith(status: QuoteStateEnum.loadedState, data: items));
    });
  }

  FutureOr<void> _onQuoteMenuEvent(
      QuoteMenuEvent event, Emitter<QuoteState> emit) async {
    switch (event.item) {
      case MenuItem.gps:
        SocialShare.getCurrentLocation();
      case MenuItem.accelerometer:
      case MenuItem.twitter:
        SocialShare.onShareTwitterQuote(
            MenuItem.twitter, state.quoteData?.content ?? "");
        break;
      case MenuItem.facebook:
        SocialShare.onShareFacebookQuote(
            MenuItem.facebook, state.quoteData?.content ?? "");
        break;
      case MenuItem.rate:
      case MenuItem.share:
        SocialShare.onShare(MenuItem.twitter, state.quoteData?.content ?? "");
        break;
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStringConstant.serverFailureMessage;
      case NoInternetFailure:
        return AppStringConstant.internetFailureMessage;
      case CacheFailure:
        return AppStringConstant.cachedFailureMessage;
      default:
        return AppStringConstant.unexpectedError;
    }
  }
}
