import 'dart:convert'; // Add this import
import 'package:movies_app/dio/movie.dart';
import 'package:movies_app/services/api.dart';

class MovieRepository {
  Future<List<Movie>> getMovies() async {
    try {
      final response = await Api().dio.get('movies-coming-soon.json');

      List<dynamic> data;
      if (response.data is String) {
        data = jsonDecode(response.data) as List<dynamic>;
      } else if (response.data is List) {
        data = response.data as List<dynamic>;
      } else {
        throw Exception('Unexpected response format');
      }

      return data.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
