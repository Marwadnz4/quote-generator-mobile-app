import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/models/favorite_quote_response.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/repos/favorites_repo.dart';
import 'package:quote_generator_mobile_app/features/favorites/logic/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;
  FavoritesCubit(this._favoritesRepo) : super(InitFavoritesState());

  void deleteQuote(String quote) async {
    emit(LoadingDeleteQuoteFromFavorites());
    final response = await _favoritesRepo.deleteQuote(quote);
    response.fold(
      (message) async {
        await getDataFromDatabase();
      },
      (message) async {
        await getDataFromDatabase();
      },
    );
  }

  List<FavoriteQuoteResponse> favorites = [];

  void search(String searchedQuote) {
    emit(LoadingGetQuoteFromDatabase());
    if (searchedQuote.isNotEmpty) {
      final searchedQuotes =
          favorites
              .where((quote) => quote.quote.contains(searchedQuote))
              .toList();
      emit(SuccessGetQuoteFromDatabase(quotes: searchedQuotes));
    } else {
      emit(SuccessGetQuoteFromDatabase(quotes: favorites));
    }
  }

  Future<void> getDataFromDatabase() async {
    emit(LoadingGetQuoteFromDatabase());
    final response = await _favoritesRepo.getDataFromDatabase();
    response.fold(
      (message) {
        emit(ErrorGetQuoteFromDatabase(message: message.message ?? 'Failure'));
      },
      (quotes) async {
        favorites = quotes;
        emit(SuccessGetQuoteFromDatabase(quotes: favorites));
      },
    );
  }
}
