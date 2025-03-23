import 'package:dartz/dartz.dart';
import 'package:quote_generator_mobile_app/core/networking/api_error_handler.dart';
import 'package:quote_generator_mobile_app/core/networking/api_error_model.dart';
import 'package:quote_generator_mobile_app/core/local_db/local_db.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/models/favorite_quote_response.dart';
import 'package:quote_generator_mobile_app/features/home/data/models/quote_response.dart';

class FavoritesRepo {
  final LocalDB _localDB;

  FavoritesRepo(this._localDB);

  Future<Either<ApiErrorModel, String>> insertToDatabase(
    QuoteResponse quote,
  ) async {
    try {
      await _localDB.insertToDatabase(quote);
      return right('Insert successful');
    } catch (error) {
      return left(ApiErrorHandler.handle('error in Insert $error'));
    }
  }

  Future<Either<ApiErrorModel, String>> deleteQuote(String quote) async {
    try {
      await _localDB.deleteQuote(quote);
      return right('Delete Quote Done');
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, List<FavoriteQuoteResponse>>>
  getDataFromDatabase() async {
    try {
      final response = await _localDB.getDataFromDatabase();
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
