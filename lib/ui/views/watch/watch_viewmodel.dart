import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tentweny_demo/app/app.locator.dart';
import 'package:tentweny_demo/app/app.router.dart';
import 'package:tentweny_demo/models/movie_models.dart';
import 'package:tentweny_demo/models/movie_query.dart';
import 'package:tentweny_demo/services/api_service.dart';

class WatchViewModel extends BaseViewModel {
  final api = locator<ApiService>();
  final navigator = locator<NavigationService>();

  final TextEditingController appBarController = TextEditingController();

  MoviesResponse? _upcomingResponse;
  MoviesResponse? _searchResponse;

  bool searchBoolean = false;

  List<Movie> get upcoming => _upcomingResponse?.results ?? [];

  List<Movie> get search => _searchResponse?.results ?? [];
  String title = "Watch";
  int currentPage = 1;

  Timer? _searchTimer;

  void fetchInitialUpcomingMovies() async {
    await runBusyFuture(
      () async {
        currentPage = 1;

        _upcomingResponse = await api.fetchUpcoming(
          MovieQuery(),
        );
      }(),
      busyObject: 'upcoming',
    );
  }

  void fetchUpcomingPage(int page) async {
    await runBusyFuture(
      () async {
        currentPage = page;

        _upcomingResponse = await api.fetchUpcoming(
          MovieQuery(page: page),
        );
      }(),
      busyObject: 'upcoming',
    );
  }

  void fetchMovieByQuery({String? query}) async {
    _searchTimer?.cancel();

    _searchTimer = Timer(
      const Duration(milliseconds: 500),
      () => runBusyFuture(
        () async {
          _searchResponse = await api.searchMovies(
            MovieQuery(page: 1, query: query ?? appBarController.text),
          );
        }(),
        busyObject: 'search',
      ),
    );
  }

  void onMovieTapped(Movie movie) {
    navigator.navigateToMovieDetailView(movie: movie);
  }

  void onSearchButtonPressed() {
    searchBoolean = true;

    notifyListeners();
  }

  void onClearButtonPressed() {
    searchBoolean = false;

    notifyListeners();
  }
}
