// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;
import 'package:tentweny_demo/models/movie_details.dart' as _i9;
import 'package:tentweny_demo/models/movie_models.dart' as _i8;
import 'package:tentweny_demo/ui/views/home/home_view.dart' as _i2;
import 'package:tentweny_demo/ui/views/movie_detail/movie_detail_view.dart'
    as _i5;
import 'package:tentweny_demo/ui/views/startup/startup_view.dart' as _i3;
import 'package:tentweny_demo/ui/views/trailer/trailer_view.dart' as _i6;
import 'package:tentweny_demo/ui/views/watch/watch_view.dart' as _i4;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const watchView = '/watch-view';

  static const movieDetailView = '/movie-detail-view';

  static const trailerView = '/trailer-view';

  static const all = <String>{
    homeView,
    startupView,
    watchView,
    movieDetailView,
    trailerView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.watchView,
      page: _i4.WatchView,
    ),
    _i1.RouteDef(
      Routes.movieDetailView,
      page: _i5.MovieDetailView,
    ),
    _i1.RouteDef(
      Routes.trailerView,
      page: _i6.TrailerView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.WatchView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.WatchView(),
        settings: data,
      );
    },
    _i5.MovieDetailView: (data) {
      final args = data.getArgs<MovieDetailViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.MovieDetailView(key: args.key, movie: args.movie),
        settings: data,
      );
    },
    _i6.TrailerView: (data) {
      final args = data.getArgs<TrailerViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.TrailerView(key: args.key, video: args.video),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MovieDetailViewArguments {
  const MovieDetailViewArguments({
    this.key,
    required this.movie,
  });

  final _i7.Key? key;

  final _i8.Movie movie;

  @override
  String toString() {
    return '{"key": "$key", "movie": "$movie"}';
  }

  @override
  bool operator ==(covariant MovieDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.movie == movie;
  }

  @override
  int get hashCode {
    return key.hashCode ^ movie.hashCode;
  }
}

class TrailerViewArguments {
  const TrailerViewArguments({
    this.key,
    required this.video,
  });

  final _i7.Key? key;

  final _i9.Video video;

  @override
  String toString() {
    return '{"key": "$key", "video": "$video"}';
  }

  @override
  bool operator ==(covariant TrailerViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.video == video;
  }

  @override
  int get hashCode {
    return key.hashCode ^ video.hashCode;
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWatchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.watchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMovieDetailView({
    _i7.Key? key,
    required _i8.Movie movie,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.movieDetailView,
        arguments: MovieDetailViewArguments(key: key, movie: movie),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrailerView({
    _i7.Key? key,
    required _i9.Video video,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.trailerView,
        arguments: TrailerViewArguments(key: key, video: video),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWatchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.watchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMovieDetailView({
    _i7.Key? key,
    required _i8.Movie movie,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.movieDetailView,
        arguments: MovieDetailViewArguments(key: key, movie: movie),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrailerView({
    _i7.Key? key,
    required _i9.Video video,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.trailerView,
        arguments: TrailerViewArguments(key: key, video: video),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
