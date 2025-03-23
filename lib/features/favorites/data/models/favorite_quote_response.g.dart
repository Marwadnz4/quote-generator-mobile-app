// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_quote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteQuoteResponse _$FavoriteQuoteResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteQuoteResponse(
  id: (json['id'] as num).toInt(),
  quote: json['quote'] as String,
  author: json['author'] as String,
);

Map<String, dynamic> _$FavoriteQuoteResponseToJson(
  FavoriteQuoteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'quote': instance.quote,
  'author': instance.author,
};
