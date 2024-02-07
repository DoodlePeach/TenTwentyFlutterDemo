import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tentweny_demo/app/app.locator.dart';
import 'package:tentweny_demo/app/app.router.dart';
import 'package:tentweny_demo/models/movie_details.dart';
import 'package:tentweny_demo/models/movie_models.dart';
import 'package:tentweny_demo/services/api_service.dart';
import 'package:collection/collection.dart';

class MovieDetailViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final api = locator<ApiService>();
  final Movie movie;
  MovieDetails? details;

  Video? get playable {
    final video = details?.videos?.results
        .firstWhereOrNull((element) => element.type == 'Trailer');

    return video ?? details?.videos?.results.firstOrNull;
  }

  Image? get logo {
    return details?.images?.logos?.firstOrNull;
  }

  List<Genre> get genres => details?.genres ?? [];

  MovieDetailViewModel({
    required this.movie,
  });

  void fetchMovieDetails() async {
    try {
      await runBusyFuture(
        () async {
          details = await api.fetchMovieDetails(movie);
        }(),
        busyObject: 'fetch-details',
        throwException: true,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void viewTrailer() {
    if (playable != null) {
      navigator.navigateToTrailerView(video: playable!);
    }
  }

  void bookTickets() {
    navigator.navigateToBookTicketView();
  }
}
