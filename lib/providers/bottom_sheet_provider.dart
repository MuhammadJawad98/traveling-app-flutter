import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

import '../views/attraction_details_page/widgets/attrraction_bottom_sheet.dart';

class BottomSheetStateProvider extends ChangeNotifier {
  double value = 0.0;

  double get getValue => value;

  void initialValue(BuildContext context) {
    value = GetScreenSize.getScreenWidth(context) * 0.05;
    notifyListeners();
  }

  void changeListener(BuildContext context) {
    value = GetScreenSize.getScreenWidth(context) * 0.5;
    notifyListeners();
  }

  void showBottomSheet(BuildContext context, widgetData) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: false,
      enableDrag: false,
      showDragHandle: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return AttractionBottomSheet(
          databotomsheet: widgetData,
          ratingValue: double.parse(widgetData.rating),
        );
      },
    );
  }
}
