import 'package:json_annotation/json_annotation.dart';

part 'favorite_quote_response.g.dart';

@JsonSerializable()
class FavoriteQuoteResponse {
  final int id;
  final String quote;
  final String author;

  factory FavoriteQuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteQuoteResponseFromJson(json);

  FavoriteQuoteResponse({
    required this.id,
    required this.quote,
    required this.author,
  });

  Map<String, dynamic> toJson() => _$FavoriteQuoteResponseToJson(this);
}
