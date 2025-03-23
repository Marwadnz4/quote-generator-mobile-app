

import 'package:quote_generator_mobile_app/features/favorites/data/models/favorite_quote_response.dart';

abstract class FavoritesState {}

class InitFavoritesState extends FavoritesState {}

class LoadingDeleteQuoteFromFavorites extends FavoritesState {}

class ErrorDeleteQuoteFromFavorites extends FavoritesState {
  final String message;

  ErrorDeleteQuoteFromFavorites({required this.message});
}

class SuccessDeleteQuoteFromFavorites extends FavoritesState {
  final String message;

  SuccessDeleteQuoteFromFavorites({required this.message});
}

class LoadingGetQuoteFromDatabase extends FavoritesState {}

class ErrorGetQuoteFromDatabase extends FavoritesState {
  final String message;

  ErrorGetQuoteFromDatabase({required this.message});
}

class SuccessGetQuoteFromDatabase extends FavoritesState {
  final List<FavoriteQuoteResponse> quotes;

  SuccessGetQuoteFromDatabase({required this.quotes});
}

