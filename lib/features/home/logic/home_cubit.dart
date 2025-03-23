import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/features/home/data/models/quote_response.dart';
import 'package:quote_generator_mobile_app/features/home/data/repos/home_repo.dart';
import 'package:quote_generator_mobile_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(InitHomeState());

  void getRandomQuote() async {
    emit(LoadingRandomQuote());
    final response = await _homeRepo.getRandomQuote();
    response.fold(
      (message) {
        emit(ErrorRandomQuote(message: message.message ?? 'Failure'));
      },
      (moviesResponse) async {
        emit(SuccessRandomQuote(quoteResponse: moviesResponse));
      },
    );
  }

  String quote = '';
  void insertOrRemoveFromDatabase(QuoteResponse quoteResponse) async {
    emit(LoadingInsertOrRemoveFromDatabase());
    if (quote != quoteResponse.quote) {
      final response = await _homeRepo.insertToDatabase(quoteResponse);
      response.fold(
        (message) {
          emit(
            ErrorInsertOrRemoveFromDatabase(
              message: message.message ?? 'Failure',
            ),
          );
        },
        (message) async {
          getDataFromDatabase();
          emit(SuccessInsertOrRemoveFromDatabase(message: message));
        },
      );
      quote = quoteResponse.quote;
    } else {
      final response = await _homeRepo.deleteQuote(quoteResponse.quote);
      response.fold(
        (message) {
          emit(
            ErrorInsertOrRemoveFromDatabase(
              message: message.message ?? 'Failure',
            ),
          );
        },
        (message) async {
          getDataFromDatabase();
          emit(SuccessInsertOrRemoveFromDatabase(message: message));
        },
      );
      quote = '';
    }
  }

  void getDataFromDatabase() async {
    emit(LoadingGetQuoteFromDatabase());
    final response = await _homeRepo.getDataFromDatabase();
    response.fold(
      (message) {
        emit(ErrorGetQuoteFromDatabase(message: message.message ?? 'Failure'));
      },
      (quotes) async {
        emit(SuccessGetQuoteFromDatabase(quotes: quotes));
      },
    );
  }
}
