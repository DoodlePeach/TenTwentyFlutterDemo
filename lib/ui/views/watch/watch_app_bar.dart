import 'package:flutter/material.dart';
import 'package:tentweny_demo/ui/views/watch/watch_viewmodel.dart';

import '../../common/app_colors.dart';

class WatchAppBar extends StatelessWidget {
  final WatchViewModel viewModel;

  const WatchAppBar({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  Widget _searchBar(WatchViewModel viewModel) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFEFEFEF),
          Color(0xFFF2F2F6),
        ]),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: color1,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: viewModel.onSearchTextFieldChanged,
              autofocus: true,
              cursorColor: color1,
              style: const TextStyle(
                color: color1,
                fontSize: 14,
              ),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'TV shows, movies and more',
                hintStyle: TextStyle(
                  color: const Color(0x202C434D).withOpacity(0.3),
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: color1,
            ),
            onPressed: viewModel.onClearButtonPressed,
          ),
        ],
      ),
    );
  }

  Widget _defaultBar(WatchViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          viewModel.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: viewModel.onSearchButtonPressed,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: viewModel.searchBoolean ? 85 : 75 * 0.85,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.fastOutSlowIn,
        child: !viewModel.searchBoolean
            ? _defaultBar(viewModel)
            : _searchBar(viewModel),
      ),
    );
  }
}
