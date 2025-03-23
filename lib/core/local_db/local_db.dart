import 'package:quote_generator_mobile_app/features/favorites/data/models/favorite_quote_response.dart';
import 'package:quote_generator_mobile_app/features/home/data/models/quote_response.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {
  final Database database;
  List<FavoriteQuoteResponse> favorites = [];

  LocalDB(this.database);

  Future<void> insertToDatabase(QuoteResponse quote) async {
    await database.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO favorites(quote, author) VALUES("${quote.quote}", "${quote.author}")',
      );
      return null;
    });
  }

  Future<List<FavoriteQuoteResponse>> getDataFromDatabase() async {
    List<Map<String, Object?>> favoritesDatabase = await database.rawQuery(
      'SELECT * FROM favorites',
    );
    favorites.clear();
    for (var element in favoritesDatabase) {
      favorites.add(FavoriteQuoteResponse.fromJson(element));
    }
    return favorites;
  }

  Future<void> deleteQuote(String quote) async {
    await database.rawDelete('DELETE FROM favorites WHERE quote = ?', [quote]);
  }
}
