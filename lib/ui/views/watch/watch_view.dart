import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tentweny_demo/ui/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:tentweny_demo/ui/views/watch/watch_app_bar.dart';
import 'package:tentweny_demo/ui/views/watch/watch_search.dart';
import 'package:tentweny_demo/ui/views/watch/watch_upcoming.dart';

import '../../common/app_colors.dart';
import 'watch_viewmodel.dart';

class WatchView extends StackedView<WatchViewModel> {
  const WatchView({Key? key}) : super(key: key);

  Widget buildLayout(WatchViewModel viewModel) {
    if (viewModel.searchBoolean) {
      return WatchSearch(
        watchViewModel: viewModel,
      );
    } else {
      return WatchUpcoming(
        watchViewModel: viewModel,
      );
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
    viewModel.fetchInitialUpcomingMovies();
  }
}
