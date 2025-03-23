import 'package:quote_generator_mobile_app/features/favorites/data/models/favorite_quote_response.dart';
import 'package:quote_generator_mobile_app/features/home/data/models/quote_response.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class LoadingRandomQuote extends HomeState {}

class SuccessRandomQuote extends HomeState {
  final QuoteResponse quoteResponse;

  SuccessRandomQuote({required this.quoteResponse});
}

class ErrorRandomQuote extends HomeState {
  final String message;

  ErrorRandomQuote({required this.message});
}

class LoadingInsertOrRemoveFromDatabase extends HomeState {}

class ErrorInsertOrRemoveFromDatabase extends HomeState {
  final String message;

  ErrorInsertOrRemoveFromDatabase({required this.message});
}

class SuccessInsertOrRemoveFromDatabase extends HomeState {
  final String message;

  SuccessInsertOrRemoveFromDatabase({required this.message});
}

class LoadingGetQuoteFromDatabase extends HomeState {}

class ErrorGetQuoteFromDatabase extends HomeState {
  final String message;

  ErrorGetQuoteFromDatabase({required this.message});
}

class SuccessGetQuoteFromDatabase extends HomeState {
  final List<FavoriteQuoteResponse> quotes;

  SuccessGetQuoteFromDatabase({required this.quotes});
}
