import 'package:dio/dio.dart';

class Api {
  static final Api _instance = Api._internal();

  factory Api() => _instance;

  late final Dio dio;

  Api._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/',
    ));
  }
}
