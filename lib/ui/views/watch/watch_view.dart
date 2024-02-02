import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tentweny_demo/ui/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:tentweny_demo/ui/views/watch/watch_app_bar.dart';
import 'package:tentweny_demo/ui/views/watch/watch_upcoming_card.dart';

import '../../common/app_colors.dart';
import '../../error_widget/custom_error_widget.dart';
import 'watch_viewmodel.dart';

class WatchView extends StackedView<WatchViewModel> {
  const WatchView({Key? key}) : super(key: key);

  Widget _searchListView(WatchViewModel viewModel) {
    return SliverList.builder(
      itemCount: viewModel.filtered.length,
      itemBuilder: (context, index) {
        final item = viewModel.filtered[index];

        return WatchUpcomingCard(
          movie: item,
          onTap: () => viewModel.onMovieTapped(item),
        );
      },
    );
  }

  Widget _browsingView(WatchViewModel viewModel) {
    return SliverList.builder(
      itemCount: viewModel.currentResponse?.results.length ?? 0,
      itemBuilder: (context, index) {
        final item = viewModel.currentResponse!.results[index];
        return WatchUpcomingCard(
          movie: item,
          onTap: () => viewModel.onMovieTapped(item),
        );
      },
    );
  }

  Widget buildLayout(WatchViewModel viewModel) {
    if (viewModel.busy('upcoming')) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(
            color: color1,
          ),
        ),
      );
    } else if (viewModel.error('upcoming') != null) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CustomErrorWidget(
            onRetry: viewModel.fetchUpcoming,
          ),
        ),
      );
    } else if (viewModel.searchBoolean) {
      return _searchListView(viewModel);
    } else {
      return _browsingView(viewModel);
    }
  }

  @override
  Widget builder(
    BuildContext context,
    WatchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      bottomNavigationBar: const BottomNavBarView(),
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          // mainAxisSize: MainAxisSize.min,
          slivers: [
            WatchAppBar(viewModel: viewModel),
            buildLayout(viewModel),
          ],
        ),
      ),
    );
  }

  @override
  WatchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WatchViewModel();

  @override
  void onViewModelReady(WatchViewModel viewModel) {
    viewModel.fetchUpcoming();
  }
}
