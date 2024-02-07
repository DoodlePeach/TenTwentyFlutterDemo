import 'package:tentweny_demo/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tentweny_demo/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tentweny_demo/ui/views/home/home_view.dart';
import 'package:tentweny_demo/ui/views/watch/watch_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tentweny_demo/services/api_service.dart';
import 'package:tentweny_demo/ui/views/startup/startup_view.dart';
import 'package:tentweny_demo/ui/views/movie_detail/movie_detail_view.dart';
import 'package:tentweny_demo/ui/views/trailer/trailer_view.dart';
import 'package:tentweny_demo/ui/views/book_ticket/book_ticket_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: WatchView),
    MaterialRoute(page: MovieDetailView),
    MaterialRoute(page: TrailerView),
    MaterialRoute(page: BookTicketView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
