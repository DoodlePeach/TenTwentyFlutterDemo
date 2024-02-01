import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tentweny_demo/ui/common/app_colors.dart';

import 'bottom_nav_bar_viewmodel.dart';

class BottomNavBarView extends StackedView<BottomNavBarViewModel> {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavBarViewModel viewModel,
    Widget? child,
  ) {
    const radius = 25.0;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius),
          topLeft: Radius.circular(radius),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: color1,
          // Not needed
          // currentIndex: viewModel.currentIndex,
          // onTap: viewModel.setIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: color3,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              label: 'Dashboard',
              icon: SvgPicture.asset('assets/icons/dashboard.svg'),
            ),
            BottomNavigationBarItem(
              label: 'Watch',
              icon: SvgPicture.asset('assets/icons/watch.svg'),
            ),
            BottomNavigationBarItem(
              label: 'Media Library',
              icon: SvgPicture.asset('assets/icons/media_library.svg'),
            ),
            BottomNavigationBarItem(
              label: 'More',
              icon: SvgPicture.asset('assets/icons/more.svg'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BottomNavBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavBarViewModel();
}
