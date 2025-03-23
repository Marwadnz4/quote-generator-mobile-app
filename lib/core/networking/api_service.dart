import 'package:dio/dio.dart';
import 'package:quote_generator_mobile_app/core/networking/api_constants.dart';
import 'package:quote_generator_mobile_app/core/networking/dio_factory.dart';
import 'package:quote_generator_mobile_app/features/home/data/models/quote_response.dart';

class ApiService {
  final Dio dio;
  const ApiService(this.dio);

  Future<QuoteResponse> getRandomQuote() async {
    var response = await DioFactory.getData(endPoint: ApiConstants.quotes);
    List<QuoteResponse> quotes = [];
    for (var quote in response.data) {
      quotes.add(
        QuoteResponse.fromJson(quote),
      );
    }
    return quotes.first;
  }
}
