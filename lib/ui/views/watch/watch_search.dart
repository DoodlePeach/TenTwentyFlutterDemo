import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tentweny_demo/ui/views/watch/watch_search_card.dart';
import 'package:tentweny_demo/ui/views/watch/watch_viewmodel.dart';

import '../../common/app_colors.dart';
import '../../error_widgets/custom_error_widget.dart';

class WatchSearch extends StatelessWidget {
  final WatchViewModel watchViewModel;

  const WatchSearch({
    Key? key,
    required this.watchViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (watchViewModel.busy('search')) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: SizedBox.expand(
          child: Center(
            child: CircularProgressIndicator(
              color: color1,
            ),
          ),
        ),
      );
    } else if (watchViewModel.error('search') != null) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: SizedBox.expand(
          child: Center(
            child: CustomErrorWidget(
              onRetry: watchViewModel.fetchMovieByQuery,
            ),
          ),
        ),
      );
    } else if (watchViewModel.search.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: SizedBox.expand(
          child: Center(
            child: CustomErrorWidget(
              message: 'There are no search results for that query.',
            ),
          ),
        ),
      );
    } else {
      return MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Results',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: color1,
                    ),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: watchViewModel.search.length,
            itemBuilder: (context, index) {
              final item = watchViewModel.search[index];

              return WatchSearchCard(
                movie: item,
                onTap: () => watchViewModel.onMovieTapped(item),
              );
            },
          ),
        ],
      );
    }
  }
}
