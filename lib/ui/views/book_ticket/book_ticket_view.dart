import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tentweny_demo/ui/common/ui_helpers.dart';

import 'book_ticket_viewmodel.dart';

class BookTicketView extends StackedView<BookTicketViewModel> {
  const BookTicketView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      BookTicketViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: InteractiveViewer(
                    transformationController: viewModel.controller,
                    alignment: Alignment.center,
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(8),
                    child: theaterWidget(),
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 15,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: viewModel.onZoomInTapped,
                        icon: const Icon(
                          Icons.zoom_in,
                        ),
                      ),
                      IconButton(
                        onPressed: viewModel.onZoomOutTapped,
                        icon: const Icon(
                          Icons.zoom_out,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.black,
              child: const SizedBox.expand(
                  child: Icon(
                    Icons.work_off_outlined,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget theaterWidget() {
    const rowCount = 15;
    const columnCount = 30;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(width: 450, 'assets/icons/screen.svg'),
        verticalSpaceMedium,
        SizedBox(
          height: 700,
          width: 500,
          child: GridView.builder(
            itemCount: rowCount * columnCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columnCount,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final column = index % columnCount;
              final row = index ~/ rowCount + 1;

              if (column == 10 || column == 20) {
                return Container();
              } else if (column == 0) {
                return FittedBox(child: Text(row.toString()));
              }

              return SvgPicture.asset(
                height: 1,
                width: 1,
                'assets/icons/seat.svg',
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  BookTicketViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      BookTicketViewModel();
}