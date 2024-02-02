import 'package:dio/dio.dart';
import 'package:tentweny_demo/models/movie_models.dart';
import '../common/app_constants.dart';
import '../models/movie_details.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      // No need to use interceptors for dynamically loading headers.
      headers: {
        'Authorization': 'Bearer $API_KEY',
      }));

  Future<MoviesResponse> upcoming() async {
    final response = await dio.get('/movie/upcoming');
    final data = response.data;

    return MoviesResponse.fromJson(data);
  }

  Future<MovieDetails> movieDetail(Movie movie) async {
    final response = await dio.get('/movie/${movie.id}',
        queryParameters: {'append_to_response': 'videos,images'});
    final data = response.data;

    return MovieDetails.fromJson(data);
  }
}
