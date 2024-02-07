import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BookTicketViewModel extends BaseViewModel {
  TransformationController controller = TransformationController();

  void onZoomInTapped() {
    controller.value = controller.value * 1.5;
    notifyListeners();
  }

  void onZoomOutTapped() {
    controller.value = controller.value * 0.8;
    notifyListeners();
  }
}