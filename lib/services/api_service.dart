import 'package:dio/dio.dart';
import 'package:tentweny_demo/models/movie_models.dart';
import 'package:tentweny_demo/models/movie_query.dart';
import '../common/app_constants.dart';
import '../models/movie_details.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      // No need to use interceptors for dynamically loading headers.
      headers: {
        'Authorization': 'Bearer $API_KEY',
      }));

  Future<MoviesResponse> fetchUpcoming(MovieQuery query) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: query.toJson(),
    );

    final data = response.data;

    return MoviesResponse.fromJson(data);
  }

  Future<MoviesResponse> searchMovies(MovieQuery query) async {
    final response = await dio.get(
      '/search/movie',
      queryParameters: query.toJson(),
    );
    final data = response.data;

    return MoviesResponse.fromJson(data);
  }

  Future<MovieDetails> fetchMovieDetails(Movie movie) async {
    final response = await dio.get('/movie/${movie.id}',
        queryParameters: {'append_to_response': 'videos,images'});
    final data = response.data;

    return MovieDetails.fromJson(data);
  }
}
