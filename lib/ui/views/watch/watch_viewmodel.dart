import 'package:stacked/stacked.dart';

class WatchViewModel extends BaseViewModel {
  bool searchBoolean = false;
  List<int> searchIndexList = [];
  String title = "Watch";

  final List<String> list = [
    'English Textbook',
    'Japanese Textbook',
    'English Vocabulary',
    'Japanese Vocabulary'
  ];

  void onSearchTextFieldChanged(String s) {
    searchIndexList = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].contains(s)) {
        searchIndexList.add(i);
      }
    }

    notifyListeners();
  }

  void onSearchButtonPressed() {
    searchBoolean = true;
    searchIndexList = [];

    notifyListeners();
  }

  void onClearButtonPressed() {
    searchBoolean = false;

    notifyListeners();
  }
}
