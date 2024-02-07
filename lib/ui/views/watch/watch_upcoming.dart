import 'package:flutter/material.dart';
import 'package:tentweny_demo/ui/views/watch/watch_viewmodel.dart';

import '../../../models/movie_models.dart';
import '../../common/app_colors.dart';
import '../../error_widgets/custom_error_widget.dart';
import 'watch_upcoming_card.dart';

class WatchUpcoming extends StatelessWidget {
  final WatchViewModel watchViewModel;

  const WatchUpcoming({
    Key? key,
    required this.watchViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (watchViewModel.busy('upcoming')) {
      return const SliverFillRemaining(
        child: SizedBox.expand(
          child: Center(
            child: CircularProgressIndicator(
              color: color1,
            ),
          ),
        ),
      );
    } else if (watchViewModel.error('upcoming') != null) {
      return SliverFillRemaining(
        child: SizedBox.expand(
          child: Center(
            child: CustomErrorWidget(
              onRetry: watchViewModel.fetchInitialUpcomingMovies,
            ),
          ),
        ),
      );
    } else {
      return SliverList.builder(
        itemCount: watchViewModel.upcoming.length,
        itemBuilder: (context, index) {
          final item = watchViewModel.upcoming[index];

          return WatchUpcomingCard(
            movie: item,
            onTap: () => watchViewModel.onMovieTapped(item),
          );
        },
      );
    }
  }
}
