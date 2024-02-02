import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tentweny_demo/app/app.locator.dart';
import 'package:tentweny_demo/app/app.router.dart';
import 'package:tentweny_demo/models/movie_models.dart';
import 'package:tentweny_demo/services/api_service.dart';

class WatchViewModel extends BaseViewModel {
  final api = locator<ApiService>();
  final navigator = locator<NavigationService>();

  MoviesResponse? currentResponse;

  bool searchBoolean = false;
  List<Movie> filtered = [];
  String title = "Watch";

  void onSearchTextFieldChanged(String s) {
    filtered = [];
    for (int i = 0; i < (currentResponse?.results.length ?? 0); i++) {
      if (currentResponse!.results[i].title
          .toLowerCase()
          .contains(s.toLowerCase())) {
        filtered.add(currentResponse!.results[i]);
      }
    }

    notifyListeners();
  }

  void onSearchButtonPressed() {
    searchBoolean = true;
    filtered
      ..clear()
      ..addAll(currentResponse?.results ?? []);

    notifyListeners();
  }

  void onClearButtonPressed() {
    searchBoolean = false;
    filtered.clear();

    notifyListeners();
  }

  void fetchUpcoming() async {
    await runBusyFuture(
      () async {
        currentResponse = await api.upcoming();
      }(),
      busyObject: 'upcoming',
    );
  }

  void onMovieTapped(Movie movie) {
    navigator.navigateToMovieDetailView(movie: movie);
  }
}
