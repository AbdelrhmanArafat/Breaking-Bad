// ignore_for_file: avoid_print

import 'package:breaking_bad/constants/end_point.dart';
import 'package:dio/dio.dart';

class DioHelper {
  late Dio dio;

  DioHelper() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

    Future<List<dynamic>> getCharactersQuotes(String characterName) async {
    try {
      Response response = await dio.get('quote' , queryParameters: {'author' : characterName});
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
