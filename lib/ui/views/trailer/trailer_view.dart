import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tentweny_demo/models/movie_details.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'trailer_viewmodel.dart';

class TrailerView extends StackedView<TrailerViewModel> {
  final Video video;

  const TrailerView({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TrailerViewModel viewModel,
    Widget? child,
  ) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: FittedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              YoutubePlayer(
                controller: viewModel.controller,
                // showVideoProgressIndicator: true,
                onEnded: (_) => viewModel.onExitRequired(),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: IconButton(
                  onPressed: viewModel.onExitRequired,
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  TrailerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TrailerViewModel(
        video: video,
      );
}
