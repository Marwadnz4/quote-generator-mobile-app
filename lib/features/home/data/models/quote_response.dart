import 'package:json_annotation/json_annotation.dart';

part 'quote_response.g.dart';

@JsonSerializable()
class QuoteResponse {
  final String quote;
  final String author;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseFromJson(json);

  QuoteResponse({
    required this.quote,
    required this.author,
  });

  Map<String, dynamic> toJson() => _$QuoteResponseToJson(this);
}
