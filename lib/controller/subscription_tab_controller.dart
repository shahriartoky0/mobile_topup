import 'package:get/get.dart';

class SubscriptionTabController extends GetxController {
  RxBool isSelected = true.obs; // for the toggle button
  var selectedTopUpIndex = (-1).obs;
  var selectedPlansIndex = (-1).obs;

  void updateSelectedTopUpTile(int index) {
    selectedTopUpIndex.value = index;
  }

  void updateSelectedPlanTile(int index) {
    selectedPlansIndex.value = index;
  }
}
