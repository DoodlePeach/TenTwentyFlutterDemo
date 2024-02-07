import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../app/app.locator.dart';
import '../../../models/movie_details.dart';

class TrailerViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  final Video video;
  final YoutubePlayerController controller;

  TrailerViewModel({
    required this.video,
  }) : controller = YoutubePlayerController(
          initialVideoId: video.key ?? "",
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            hideControls: true,
          ),
        )..toggleFullScreenMode() {
    if (video.key == null) {
      onExitRequired();
    }
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    controller.dispose();
  }

  void onExitRequired() {
    navigator.back();
  }
}
